
# SwiftUI: 액터(Actor), 메인액터(MainActor), 동시성(Concurrency), 생명주기 이벤트(Lifecycle Events)

---

## 1) Actor (액터)

### 1.1 개념
- Actor는 Swift의 동시성 모델에서 **데이터 경쟁(Data Race)**을 방지하기 위해 등장한 참조 타입.
- 클래스와 비슷하게 속성, 메서드, 초기화를 가질 수 있음.
- 차이점: 액터 내부의 상태에 동시 접근할 수 없고, 직렬화(serialized)된 접근만 허용. 즉, 여러 스레드에서 동시에 접근해도 안전(thread-safe).

```swift

actor Counter {
    private var value = 0
    
    func increment() {
        value += 1
    }
    
    func getValue() -> Int {
        return value
    }
}

let counter = Counter()

Task {
    await counter.increment()
    print(await counter.getValue())
}

```
- await이 필요한 이유: 액터 내부 메서드 접근은 비동기 컨텍스트에서만 가능.
- 여러 Task가 동시에 접근해도 Race Condition이 발생하지 않음.

---

### 1.2 클래스와 액터의 차이점

| 항목     | Class               | Actor           |
| ------ | ------------------- | --------------- |
| 동시성 제어 | 없음 → 직접 Lock/GCD 필요 | 자동 직렬화          |
| 접근     | 동기적                 | 비동기(`await`) 필요 |
| 데이터 경쟁 | 발생 가능               | 원천 차단           |

---

## 2) MainActor (메인 액터)

### 2.1 개념
- MainActor는 전역(Global) 액터.
- UI 업데이트는 반드시 메인 스레드에서만 수행해야 하므로 SWiftUI와 UIKit은 MainActor를 통해 원칙을 강제
- @MainActor 속성(프로퍼티, 메서드, 타입 단위)에 선언하면 해당 코드가 항상 메인 스레드에서 실행됨.

```swift

@MainActor
class ViewModel: ObservableObject {
    @Published var text: String = "초기값"
    
    func updateText() {
        text = "업데이트 완료"
    }
}

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Text(vm.text)
            .task {
                await vm.updateText()
            }
    }
}

```
- @MainActor가 붙은 메서드 → UI Thread(Main Thread)에서 안전하게 실행.
- SwiftUI 내부의 @State, @Binding, @Published 프로퍼티 업데이트는 대부분 MainActor 아래에서 동작.
