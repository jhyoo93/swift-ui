# 🌱 SwiftUI 아키텍처  

📌 **앱 계층 구조**  

<img width="618" height="253" alt="swiftui-architecture" src="https://github.com/user-attachments/assets/85cee8e6-b059-4301-8f8c-690906413657" />   

📌 **구성 요소**  
- **App** → 앱의 진입점, 생명주기 및 Scene 관리 (앱당 1개)  
- **Scene** → 화면 단위 영역  
  - iOS / watchOS → 주로 전체 화면  
  - iPadOS / macOS → 다중 Scene 지원  
- **View** → UI의 기본 빌딩 블록 (텍스트, 버튼 등)  
  - 단일 요소 또는 다른 뷰를 감싸는 컨테이너  

📌 **특징**  
- **선언형 UI** → 상태 변화에 따라 UI가 자동으로 업데이트  
- **조합 기반 설계** → 작은 View들을 조립해 유연한 인터페이스 구성  

---

# 🌱 SwiftUI 핵심 이론 정리

SwiftUI는 iOS, macOS, watchOS, tvOS에서 공통으로 사용할 수 있는 **선언형 UI 프레임워크**입니다.  
코드보다 이론을 빠르게 복습할 수 있도록 핵심만 정리했습니다.

---

## 1. 선언형 UI (Declarative UI)
- **“무엇을 보여줄지”** 선언 → UIKit의 명령형(How)과 차이
- 예시: `Text("Hello")` → "Hello" 텍스트가 화면에 표시됨

---

## 2. 상태 관리 (State Management)
UI는 데이터의 상태에 따라 자동 업데이트 됩니다.  
주요 프로퍼티 래퍼:
- `@State` : 뷰 내부의 단순 상태 저장
- `@Binding` : 부모-자식 간 상태 공유
- `@ObservedObject` : 외부 객체 감시
- `@EnvironmentObject` : 앱 전역 상태 공유

---

## 3. 뷰 구조 (View Composition)
- SwiftUI의 모든 UI는 **View 프로토콜**을 채택한 `struct`
- Lego 블록처럼 작은 뷰를 조합해 큰 뷰를 구성
- 뷰는 **값 타입(struct)** → 가볍고 성능 효율적

---

## 4. 레이아웃 시스템
- 기본 컨테이너: `HStack`, `VStack`, `ZStack`
- Modifier 체인으로 스타일 적용  
  예: `Text("Hi").font(.title).foregroundColor(.blue)`
- Auto Layout이 아니라 **SwiftUI 자체 레이아웃 엔진** 활용

---

## 5. 데이터 흐름 (Data Flow)
- 데이터는 항상 **상위 → 하위 (단방향)**
- 상태 변경 시, SwiftUI가 자동으로 해당 뷰를 **리렌더링**

---

## 6. 라이프사이클
- 앱 시작점: `@main`
- `App` 프로토콜 → 전체 앱의 진입점과 Scene 관리
- `Scene` → 윈도우나 여러 화면 구조 관리

---

## 7. 비동기/동시성
- Swift Concurrency (`async/await`)와 자연스럽게 연동
- UI 업데이트는 항상 **MainActor (메인 스레드)**에서 실행

---
