//
//  ContentView.swift
//  HighRollers
//
//  Created by WeMa Mobile on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice = 1
    @State private var diceType = 6
    @State private var rollResults = [Int]()
    @State private var totalRolled = 0
    @State private var previousRolls: [[Int]] = []
    
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
                .padding()

                // Dice Type Picker
                Picker("Type of Dice", selection: $diceType) {
                    ForEach(diceTypes, id: \.self) { type in
                        Text("\(type)-sided")
                    }
                }
                .pickerStyle(.automatic)
                .padding()
                
                // Roll Button
                Button(action: rollDice) {
                    Text("Roll the Dice!")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
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
                        ForEach(previousRolls, id: \.self) { roll in
                            Text(roll.map { String($0) }.joined(separator: ", "))
                        }
                    }
                }
            }
            .navigationTitle("HighRollers")
        }
    }

    // Rolling dice logic
    func rollDice() {
        rollResults = (0...numberOfDice).map { _ in
            Int.random(in: 1...diceType)
        }
        totalRolled = rollResults.reduce(0, +)
        previousRolls.append(rollResults)
    }
}

#Preview {
    ContentView()
}
