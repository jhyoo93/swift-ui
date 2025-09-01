//
//  AnimationView.swift
//  Demo1
//
//  Created by 유재환 on 9/1/25.
//

import SwiftUI

// 예제코드 실습
struct AnimationView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"

    var body: some View {
        VStack {
            Spacer()
            Text(text)
                 .font(.largeTitle)
                 .fontWeight(.heavy)
                 .rotationEffect(.degrees(rotation))
                 .animation(.easeInOut(duration: 5), value: rotation) //easeInOut 효과 5초동안 애니메이션
                 .foregroundStyle(colors[colorIndex])
            Spacer()
            Divider()
            
             Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                 .padding()
             
             // 입력창
             TextField("Enter text here", text: $text)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
             
             // 색상 피커
             Picker(selection: $colorIndex, label: Text("Color")) {
                 ForEach (0 ..< colornames.count, id:\.self) {
                     Text(self.colornames[$0])
                         .foregroundStyle(self.colors[$0])
                 }
             }
             .pickerStyle(.wheel)
             .padding()
        }
       
    }
}

#Preview {
    AnimationView()
}
