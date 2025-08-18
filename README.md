# iOS앱 개발 딥다이브

### SwiftUI 아키텍처

📌 SwiftUI 앱 계층 구조   
<img width="618" height="253" alt="image" src="https://github.com/user-attachments/assets/85cee8e6-b059-4301-8f8c-690906413657" />   
  
- App → 앱의 진입점, 생명주기와 Scene 관리 (앱당 1개)  
- Scene → 화면 단위 영역, iOS/watchOS는 주로 전체 화면, iPadOS/macOS는 다중 Scene 가능  
- View → UI의 기본 빌딩 블록 (버튼, 텍스트 등). 단일 요소 또는 다른 뷰를 감싸는 컨테이너 형태  
  
📌 구조 및 특징
- App → Scene → View 계층 구조  
- View는 재사용 가능하며, 조합을 통해 유연한 UI 설계 가능  
- SwiftUI는 선언형 문법으로 UI 상태와 데이터 변화를 자동 반영  

  
🌱 SwiftUI 아키텍처
📌 계층 구조
App
 └─ Scene
      └─ View

🏗️ 구성 요소

App

앱의 진입점, 생명주기와 Scene 관리 (앱당 1개)

Scene

화면 단위 영역

iOS / watchOS → 보통 전체 화면

iPadOS / macOS → 다중 Scene 가능

View

UI의 기본 빌딩 블록 (텍스트, 버튼 등)

단일 요소 또는 컨테이너 형태로 재사용 가능

✨ 특징

선언형 UI → 상태 변화에 따라 자동 업데이트

조합 기반 → 작은 View들을 조립해 유연한 인터페이스 설계

  
