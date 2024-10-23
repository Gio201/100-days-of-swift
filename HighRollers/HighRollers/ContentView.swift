//
//  ContentView.swift
//  HighRollers
//
//  Created by WeMa Mobile on 21/10/2024.
//

import SwiftData
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var numberOfDice = 1
    @State private var diceType = 6
    @State private var rollResults = [Int]()
    @State private var totalRolled = 0
    
    @Environment(\.modelContext) private var modelContext // For the swiftdata
    @Query private var previousRolls: [Roll]
    
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]

    var body: some View {
        NavigationView {
            VStack {
                // Dice Picker
                Picker("Number of Dice", selection: $numberOfDice) {
                    ForEach(1..<11) { number in
                        Text("\(number) Dice")
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
                .padding()

                // Dice Type Picker
                Picker("Type of Dice", selection: $diceType) {
                    ForEach(diceTypes, id: \.self) { type in
                        Text("\(type)-sided")
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
                .padding()
                
                // Roll Button
                Button(action: rollDice) {
                    Text("Roll the Dice!")
                        .font(.title2)
                        .padding()
                        .background(Color.mint)
                        .foregroundColor(.white).bold()
                        .cornerRadius(10)
                }

                // Display Results
                if !rollResults.isEmpty {
                    VStack {
                        Text("Results: \(rollResults.map { String($0) }.joined(separator: ", "))")
                        Text("Total: \(totalRolled)")
                    }
                    .padding()
                }

                // Previous Rolls
                List {
                    Section(header: Text("Previous Rolls")) {
                        ForEach(previousRolls) { roll in
                            Text(roll.rollResults.map { String($0) }.joined(separator: ",  "))
                        }
                    }
                }
            }
            .navigationTitle("HighRollers 🎲")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clear Rolls") {
                        clearRolls()
                    }
                }
            }
        }
    }

    // Rolling dice logic
    func rollDice() {
        // Haptic feedback when you roll the dice
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.impactOccurred()

        var flickerCount = 0
        let maxFlickerCount = 10 // so many times it needs to flicker before giving out a result
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            flickerCount += 1
            
            // Generate random flicker number
            rollResults = (0..<numberOfDice).map { _ in
                Int.random(in: 1...diceType)
            }
            totalRolled = rollResults.reduce(0, +)
            
            // Stops the flickering
            if flickerCount >= maxFlickerCount {
                timer.invalidate()
                
                // Roll results
                rollResults = (0..<numberOfDice).map { _ in
                    Int.random(in: 1...diceType)
                }
                totalRolled = rollResults.reduce(0, +)
                
                // Saves the rolls in swiftData
                let newRoll = Roll(rollResults: rollResults, totalRolled: totalRolled)
                modelContext.insert(newRoll)
            }
        }
    }


    // Clears the rolls from swiftdata
    func clearRolls() {
        for roll in previousRolls {
            modelContext.delete(roll)
        }
    }
}

#Preview {
    ContentView()
}
