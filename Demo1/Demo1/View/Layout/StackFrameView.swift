//
//  ContentView.swift
//  Demo1
//
//  Created by 유재환 on 8/22/25.
//

import SwiftUI

// SwiftUI 스택과 프레임
// SwiftUI는 VStack(수직),HStack(수평), ZStack(중첩)
// 형태인 3개의 스택 레이아웃뷰를 제공한다.
struct StackFrameView: View {
    // Spacer, alignment, padding
    // 뷰 사이에 공간을 추가하기 위한 Spacer 컴포넌트를 가지고 있다.
    // 스택의 정렬은 스택이 선언될 때 값을 지정한다.
    // 간격도 지정 가능
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Finacial Results")
                .font(.title)
            
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Jaunary")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(5)
            }
            .padding(5)
        }
        .padding(5)
        
    }
}

#Preview {
    StackFrameView()
}
