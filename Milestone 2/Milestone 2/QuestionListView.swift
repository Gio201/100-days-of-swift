//
//  QuestionListView.swift
//  Milestone 2
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftUI

struct QuestionListView: View {
    @Binding var generatedQuestions: [String]
    @Binding var userAnswers: [String]
    
    var onSubmit: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<generatedQuestions.count, id: \.self) { index in
                    HStack {
                        Text(generatedQuestions[index])
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding(.vertical, 5)
                        
                        TextField("Answer", text: $userAnswers[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                    }
                }

                Button(action: onSubmit) {
                    Text("Submit Answers")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(30)
            }
        }
    }
}
