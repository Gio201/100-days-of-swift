//
//  ContentView.swift
//  Project 6
//
//  Created by WeMa Mobile on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello Swiftui")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
        DragGesture()
            .onChanged { dragAmount = $0.translation }
            .onEnded { _ in
                dragAmount = .zero
                enabled.toggle()
            }
        )
    }
}

#Preview {
    ContentView()
}
