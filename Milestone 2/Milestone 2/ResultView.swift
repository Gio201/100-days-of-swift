//
//  ResultView.swift
//  Milestone 2
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftUI

struct ResultView: View {
    var correctAnswers: Int
    var totalQuestions: Int
    var onPlayAgain: () -> Void

    var body: some View {
        VStack {
            Text("You got \(correctAnswers) out of \(totalQuestions) correct!")
                .font(.title2)
                .foregroundColor(.purple)
                .padding()

            Button(action: onPlayAgain) {
                Text("Play Again")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(30)
        }
    }
}
