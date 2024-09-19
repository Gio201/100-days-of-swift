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

    let question = ["5", "10", "20"]
    let difficulty = ["Easy", "Medium", "Hard"]

    var body: some View {
        if isQuestionsGenerated {
            if areQuestionsCompleted {
                VStack {
                    Text("You got \(correctAnswers) out of \(generatedQuestions.count) correct!")
                        .font(.title2)
                        .padding()

                    Button(action: resetView) {
                        Text("Play Again")
                    }
                    .padding(30)
                }
            } else {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(0..<generatedQuestions.count, id: \.self) { index in
                            HStack {
                                Text(generatedQuestions[index])
                                    .font(.title2)
                                    .padding(.vertical, 5)
                                
                                TextField("Answer", text: $userAnswers[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                                    .frame(width: 80)
                            }
                        }

                        Button(action: checkAnswers) {
                            Text("Submit Answers")
                        }
                        .padding(30)
                    }
                }
            }
        } else {
            VStack(spacing: 30) {
                Section {
                    VStack(spacing: 10) {
                        Text("What multiplication table do you want?")
                        Stepper(value: $quantity, in: 2...12) {
                            Text("\(quantity)")
                        }
                        .padding(.horizontal, 100)
                    }
                    .padding(30)
                }
                
                Section {
                    VStack(spacing: 10) {
                        Text("How many questions do you want?")
                        Picker("", selection: $selectedQuestion) {
                            ForEach(question, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(30)
                }
                    
                Section {
                    VStack(spacing: 10) {
                        Text("What difficulty do you like?")
                        Picker("", selection: $selectedDifficulty) {
                            ForEach(difficulty, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(30)
                }
                
                Section {
                    VStack(spacing: 10) {
                        Button {
                            generateQuestions()
                        } label: {
                            HStack(spacing: 40) {
                                Text("Generate Questions")
                            }
                        }
                    }
                    .padding(30)
                }
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
        
<<<<<<< HEAD
       var usedMultipliers = Set<Int>()
=======
        var usedMultipliers = Set<Int>()
>>>>>>> f78e398875414be61917067631f7e873b4707ce7
        
        while generatedQuestions.count < numQuestions {
            let randomMultiplier = Int.random(in: 1...maxMultiplier)
            
            if !usedMultipliers.contains(randomMultiplier) {
                let questionText = "\(quantity) x \(randomMultiplier) = "
                generatedQuestions.append(questionText)
                usedMultipliers.insert(randomMultiplier)
            }
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
