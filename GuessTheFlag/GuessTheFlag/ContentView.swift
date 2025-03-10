//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by WeMa Intern on 13/09/2024.
//

// challenge 1 | Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.

// challenge 2 | When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.

// challenge 3 | Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.

// Challenge from project 3 | Go back to project 2 and replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.

import SwiftUI

struct FlagImage: View {
    var country: String
    
    init(of country: String) {
        self.country = country
    }
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(.capsule)
            .shadow(radius: 5)    }
}


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var gameOver = false
    let maxGames = 8
    @State private var currentRound = 1
    
    @State private var rotateAmount = [0.0, 0.0, 0.0]
    @State private var opacityAmount = [1.0, 1.0, 1.0]
    @State private var scaleAmount = [1.0, 1.0, 1.0]
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.heavy))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(of: countries[number])
                                .rotation3DEffect(Angle(degrees: rotateAmount[number]), axis: (x: 0, y: 1, z: 0))
                                .opacity(opacityAmount[number])
                                .animation(.default, value: scaleAmount)
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }

                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Your score is \(self.score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Text("You're on round \(self.currentRound)")
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            
        }
        
        .alert(scoreTitle, isPresented: $gameOver) {
            Button("Restart", action: restartGame)
        } message: {
            
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
            rotateAmount[number] += 360
            
            for notTapped in 0..<3 where notTapped != number {
                opacityAmount[notTapped] = 0.25
                scaleAmount[notTapped] = 0.25
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                askQuestion()
            }
            
            } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            score += 1
            
            rotateAmount[number] += 360
            
            for notTapped in 0..<3 where notTapped != number {
                opacityAmount[notTapped] = 0.25
                scaleAmount[notTapped] = 0.25
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showingScore = true
            }
        }
        
        if number != correctAnswer {
            showingScore = true
        }
    


    }
    func askQuestion() {
        if currentRound == maxGames {
            gameOver = true
            scoreTitle = "You win your end score is: \(self.score)"
            
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            currentRound += 1
            opacityAmount = [1.0, 1.0, 1.0]
            scaleAmount = [1.0, 1.0, 1.0]
            
        }
    }
    
    func restartGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        currentRound = 1
        opacityAmount = [1.0, 1.0, 1.0]
        scaleAmount = [1.0, 1.0, 1.0]
        
    }

}

#Preview {
    ContentView()
}
