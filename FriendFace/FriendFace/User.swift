//
//  User.swift
//  FriendFace
//
//  Created by WeMa Mobile on 27/09/2024.
//

import Foundation
import SwiftData

class User: Codable, Identifiable {
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    var formattedDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}
