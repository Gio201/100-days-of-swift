//
//  Prospect.swift
//  HotProspects
//
//  Created by WeMa Mobile on 17/10/2024.
//

import SwiftData

@Model
class Prospect : Comparable {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
    
    static func <(lhs: Prospect, rhs: Prospect) -> Bool {
        return lhs.name < rhs.name
    }
}
