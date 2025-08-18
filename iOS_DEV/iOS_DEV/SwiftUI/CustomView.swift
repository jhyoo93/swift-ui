//
//  CustomView.swift
//  iOS_DEV
//
//  Created by 유재환 on 8/18/25.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("Goodbye, world!")
        }
        
    }
}

#Preview {
    CustomView()
}
