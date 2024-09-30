//
//  User.swift
//  FriendFace
//
//  Created by WeMa Mobile on 27/09/2024.
//

import Foundation
import SwiftData

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var formattedDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}
