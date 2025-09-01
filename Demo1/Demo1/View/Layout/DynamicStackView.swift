//
//  DynamicStackView.swift
//  Demo1
//
//  Created by 유재환 on 8/26/25.
//

import SwiftUI

// SwiftUI는 레이아웃에 사용되는 스택 타입을 앱 코드 내에서 동적으로 변경할 수도 있게 한다.
// AnyLayout 인스턴스를 생성하고 HStackLayout 또는 VStackLayout 컨테이너에 할당 할수있다.
struct DynamicStackView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        VStack {
            myLayout {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            HStack {
                Button(action: {
                    myLayout = AnyLayout(HStackLayout()) }){
                    Text("Hstack")
                }
                
                Button(action: {
                    myLayout = AnyLayout(VStackLayout()) }){
                    Text("Vstack")
                }
                
            }
        }
    }
}

#Preview {
    DynamicStackView()
}
