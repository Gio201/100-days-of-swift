//
//  ContentView.swift
//  Milestone 2
//
//  Created by WeMa Mobile on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var quantity: Int = 2
    @State private var selectedQuestion = "10"
    @State private var selectedDifficulty = "Medium"
    @State private var generatedQuestions: [String] = []
    @State private var isQuestionsGenerated = false
    @State private var areQuestionsCompleted = false
    @State private var userAnswers: [String] = []
    @State private var correctAnswers: Int = 0

    var body: some View {
        ZStack {
            BackgroundView()
            
            if isQuestionsGenerated {
                if areQuestionsCompleted {
                    ResultView(correctAnswers: correctAnswers, totalQuestions: generatedQuestions.count, onPlayAgain: resetView)
                } else {
                    QuestionListView(
                        generatedQuestions: $generatedQuestions,
                        userAnswers: $userAnswers,
                        onSubmit: checkAnswers
                    )
                }
            } else {
                SetupView(
                    quantity: $quantity,
                    selectedQuestion: $selectedQuestion,
                    selectedDifficulty: $selectedDifficulty,
                    onGenerateQuestions: generateQuestions
                )
            }
        }
    }

    func generateQuestions() {
        generatedQuestions.removeAll()
        userAnswers = Array(repeating: "", count: Int(selectedQuestion) ?? 10)
        
        let numQuestions = Int(selectedQuestion) ?? 10
        var maxMultiplier = 10
        
        switch selectedDifficulty {
        case "Easy":
            maxMultiplier = 5
        case "Medium":
            maxMultiplier = 12
        case "Hard":
            maxMultiplier = 20
        default:
            maxMultiplier = 10
        }
        
        for _ in 1...numQuestions {
            let randomMultiplier = Int.random(in: 1...maxMultiplier)
            let questionText = "\(quantity) x \(randomMultiplier) = "
            generatedQuestions.append(questionText)
        }
        
        isQuestionsGenerated = true
        areQuestionsCompleted = false
        correctAnswers = 0
    }
    
    func checkAnswers() {
        correctAnswers = 0
        
        for index in 0..<generatedQuestions.count {
            let questionParts = generatedQuestions[index].split(separator: " ")
            let multiplier = Int(questionParts[2]) ?? 1
            let correctAnswer = quantity * multiplier
            
            if let userAnswer = Int(userAnswers[index]), userAnswer == correctAnswer {
                correctAnswers += 1
            }
        }
        
        areQuestionsCompleted = true
    }

    func resetView() {
        isQuestionsGenerated = false
        generatedQuestions.removeAll()
        userAnswers.removeAll()
        correctAnswers = 0
        areQuestionsCompleted = false
    }
}

#Preview {
    ContentView()
}
