//
//  Rolls.swift
//  HighRollers
//
//  Created by WeMa Mobile on 22/10/2024.
//

import SwiftData

@Model
class Roll {
    var rollResults: [Int]
    var totalRolled: Int

    init(rollResults: [Int], totalRolled: Int) {
        self.rollResults = rollResults
        self.totalRolled = totalRolled

    }
}
