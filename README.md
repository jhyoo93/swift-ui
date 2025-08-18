# iOS - SwiftUI

### 🌱 SwiftUI 아키텍처  

📌 앱 계층 구조   
  
<img width="618" height="253" alt="image" src="https://github.com/user-attachments/assets/85cee8e6-b059-4301-8f8c-690906413657" />   
  
📌 구성 요소   
- App → 앱의 진입점, 생명주기와 Scene 관리 (앱당 1개)  
- Scene → 화면 단위 영역, iOS/watchOS는 주로 전체 화면, iPadOS/macOS는 다중 Scene 가능    
- View → UI의 기본 빌딩 블록 (버튼, 텍스트 등). 단일 요소 또는 다른 뷰를 감싸는 컨테이너 형태   
    
📌 특징  
- 선언형 UI → 상태 변화에 따라 자동 업데이트  
- 조합 기반 → 작은 View들을 조립해 유연한 인터페이스 설계  
  
