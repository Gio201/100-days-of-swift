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
    
    let question = ["5", "10", "20"]
    let difficulty = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        NavigationStack {
            if isQuestionsGenerated {
                VStack {
                    ForEach(generatedQuestions, id: \.self) { question in
                        Text(question)
                            .font(.title2)
                            .padding(.vertical, 5)
                    }
                    
                    Button(action: resetView) {
                        Text("Reset")
                    }
                    .padding(30)
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
    }
    
    func generateQuestions() {
        generatedQuestions.removeAll()
        
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
    }
    
    func resetView() {
        isQuestionsGenerated = false
        generatedQuestions.removeAll()
    }
}

#Preview {
    ContentView()
}
