# SwiftUI: 상태 프로퍼티, Observable, State, Environment 객체

---

## 상태 프로퍼티 및 데이터 관리
- SwiftUI는 데이터와 UI 동기화를 자동으로 처리하기 위해 다양한 상태 관리 방법을 제공한다.
- 각각의 프로퍼티 래퍼를 사용하면 뷰 계층에서 데이터 흐름을 깔끔하게 유지할 수 있다.

### 1. 상태 프로퍼티(**@State**)
- 뷰 내부 전용 상태 관리
- **String**, **Int**, **Bool**과 같은 간단한 값 저장
- 값이 변경되면 해당 뷰가 다시 그림

```swift

struct ContentView: View {
    @State private var userName = ""

    var body: some View {
        TextField("이름 입력", text: $userName)
        Text("안녕하세요, \(userName)")
    }
}

```

---

### 2. 옵저버블 객체(**ObservableObject**)
- 클래스 기반 데이터 모델 정의 시 사용
- **@Published** 프로퍼티 변경시 구독 중인 뷰 자동 업데이트

```swift

class UserData: ObservableObject {
    @Published var name: String = ""
}

```

---

### 3. 상태 객체(**@StateObject**)
- 뷰에서 ObservableObject를 생성하고 소유할 때 사용
- 뷰가 다시 그려져도 객체는 유지됨

```swift

struct ContentView: View {
    @StateObject private var userData = UserData()

    var body: some View {
        TextField("이름", text: $userData.name)
        Text("안녕하세요, \(userData.name)")
    }
}

```

---

### 4. 옵저버드 객체(**@ObservedObject**)
- 외부에서 생성된 ObservableObject를 구독할 때 사용
- 소유하지 않고 단순히 데이터만 반영

```swift

struct UserView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        Text("안녕하세요, \(userData.name)")
    }
}

```

---

### 5. 환경 객체(**@EnvironmentObject**)
- 여러 뷰에서 전역적으로 공유되는 데이터 객체
- 부모 뷰에서 **.environmentObject()** 로 주입해야 사용 가능

```swift

struct RootView: View {
    @StateObject private var userData = UserData()

    var body: some View {
        UserView()
            .environmentObject(userData)
    }
}

struct UserView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        Text("안녕하세요, \(userData.name)")
    }
}

```

---

### 6. 환경 값(**@Environment**)
- 시스템이나 부모 뷰에서 제공하는 환경 속성 값에 접근
- 예: 다크 모드 여부, 폰트 크기, 접근성 옵션 등

```swift

struct ThemeView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text("현재 모드: \(colorScheme == .dark ? "다크" : "라이트")")
    }
}

```
