//
//  ContentView.swift
//  Milestone 1
//
//  Created by WeMa Mobile on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    var game = ["🪨", "🧻", "✂️"]
    
    @State private var points = 0
    
    
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Choose")
                        .font(.largeTitle.weight(.heavy))
                    Text("Rock, Paper or scissor.")
                        .font(.largeTitle.weight(.heavy))
                }
                
                
                ForEach(0..<3) { number in Button {
                } label: {
                    Text(game[number])
                        .font(.system(size: 70))
                }
            }
                VStack {
                    Text("You have \(self.points) points")
                        .font(.system(size: 30))
                }
            }
        }
    }
}
    #Preview {
        ContentView()
}
