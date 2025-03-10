//
//  Card.swift
//  Flashzilla
//
//  Created by WeMa Mobile on 18/10/2024.
//

import Foundation

struct Card: Identifiable, Codable, Equatable {
    var id = UUID()
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
