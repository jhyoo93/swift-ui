//
//  ContentView.swift
//  Demo1
//
//  Created by 유재환 on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, perform: { value in
                print("onChange triggered")
            })
                
    }
            
}

#Preview {
    ContentView()
}
