//
//  SecondTimerCountView.swift
//  Demo1
//
//  Created by 유재환 on 9/1/25.
//

import SwiftUI

struct SecondTimerCountView: View {
    
    // ObservedObject 객체를 Second View에 전달
    // @StateObject var timerData: TimerData
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    SecondTimerCountView().environmentObject(TimerData())
}
