//
//  SetupView.swift
//  Milestone 2
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftUI

struct SetupView: View {
    @Binding var quantity: Int
    @Binding var selectedQuestion: String
    @Binding var selectedDifficulty: String

    let question = ["5", "10", "20"]
    let difficulty = ["Easy", "Medium", "Hard"]

    var onGenerateQuestions: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            Section {
                VStack(spacing: 10) {
                    Text("What multiplication table do you want?")
                        .foregroundColor(.blue)
                    Stepper(value: $quantity, in: 2...12) {
                        Text("\(quantity)")
                            .foregroundColor(.purple)
                            .font(.title)
                    }
                    .padding(.horizontal, 100)
                }
                .padding(30)
            }
            
            Section {
                VStack(spacing: 10) {
                    Text("How many questions do you want?")
                        .foregroundColor(.blue)
                    Picker("", selection: $selectedQuestion) {
                        ForEach(question, id: \.self) {
                            Text($0)
                                .foregroundColor(.purple)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(30)
            }
                
            Section {
                VStack(spacing: 10) {
                    Text("What difficulty do you like?")
                        .foregroundColor(.blue)
                    Picker("", selection: $selectedDifficulty) {
                        ForEach(difficulty, id: \.self) {
                            Text($0)
                                .foregroundColor(.purple)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(30)
            }
            
            Section {
                VStack(spacing: 10) {
                    Button(action: onGenerateQuestions) {
                        Text("Generate Questions")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(10)
                    }
                }
                .padding(30)
            }
        }
    }
}
