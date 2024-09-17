//
//  ContentView.swift
//  Milestone 1
//
//  Created by WeMa Mobile on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    var game = ["🪨", "🧻", "✂️"]
    private let maxRound = 10
    @State private var points = 0
    @State private var currentRound = 1
    
    @State private var isShowingScore = false
    @State private var gameOver = false
    
    @State private var howToWin = Bool.random()
    @State private var scoreTitle = ""
    
    @State private var botChoice: Int = Int.random(in: 0...2)
    @State private var playerPick = -1
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.1, green: 1.2, blue: 0.4),
                        Color(red: 0.8, green: 1, blue: 0.25),
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Rock Paper Scissor")
                    .font(.largeTitle.bold())
                    .padding(.bottom, -10)
                
                
            HStack(spacing: 0){
                Text("How to \(howToWin ? "win" : "lose") this round") }
            .font(.title2.bold())
            .padding(10)
                
            Spacer()
                
            HStack(spacing: 30){
                ForEach(0..<3) { number in Button {
                } label: {
                    Text(game[number])
                        .font(.system(size: 60))
                }
            }
        }
                
            Spacer()
                
            Text("Round: \(currentRound)/\(maxRound)")
                .font(.title.bold())
                
            Text("Score: \(self.points)")
                    .padding(.top, -10)
                    .font(.title2)
                
            Spacer()
                
            }
        }
    }
    
    func askQuestion() {
        if currentRound == maxRound {
            gameOver = true
        } else {
            currentRound += 1
            howToWin.toggle()
            botChoice = Int.random(in: 0...2)
        }
    }
    
    func restartGame() {
        howToWin = Bool.random()
        botChoice = Int.random(in: 0...2)
        points = 0
        currentRound = 1
    }
}

#Preview {
    ContentView()
}
