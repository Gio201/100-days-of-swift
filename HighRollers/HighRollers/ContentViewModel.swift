//
//  ContentViewModel.swift
//  HighRollers
//
//  Created by WeMa Mobile on 23/10/2024.
//

import SwiftUI
import SwiftData

@Observable
class ContentViewModel {
    var numberOfDice = 1
    var diceType = 6
    var rollResults = [Int]()
    var totalRolled = 0
    
    // Rolling dice logic
    func rollDice(modelContext: ModelContext) {
        // Haptic feedback when you roll the dice
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.impactOccurred()
        
        var flickerCount = 0
        let maxFlickerCount = 10
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
            flickerCount += 1
            
            rollResults = (0..<numberOfDice).map { _ in
                Int.random(in: 1...diceType)
            }
            totalRolled = rollResults.reduce(0, +)
            
            if flickerCount >= maxFlickerCount {
                timer.invalidate()
                
                rollResults = (0..<numberOfDice).map { _ in
                    Int.random(in: 1...diceType)
                }
                totalRolled = rollResults.reduce(0, +)
                
                let newRoll = Roll(rollResults: rollResults, totalRolled: totalRolled)
                modelContext.insert(newRoll)
            }
        }
    }
}
