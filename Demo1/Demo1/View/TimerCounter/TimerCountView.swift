//
//  TimerCountView.swift
//  Demo1
//
//  Created by 유재환 on 9/1/25.
//

import SwiftUI

struct TimerCountView: View {
    
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount){
                    Text("Reset Count")
                }
                
                // 내비게이션 링크를 추가
                // 두 개의 뷰 모두가 동일한 Observable 객체 인스턴스를 구독
                NavigationLink(destination: SecondTimerCountView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
        // environmentObject() 수정자를 추가
        // timerData 인스턴스 뷰 계층 환경에 삽입
        .environmentObject(timerData)
    }

    func resetCount() {
        timerData.resetCount()
    }
}

#Preview {
    TimerCountView()
}
