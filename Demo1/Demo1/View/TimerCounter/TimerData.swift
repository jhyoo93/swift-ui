//
//  TimerData.swift
//  Demo1
//
//  Created by 유재환 on 9/1/25.
//

import Foundation
import Combine

class TimerData: ObservableObject {
    
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
