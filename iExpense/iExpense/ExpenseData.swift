//
//  ExpenseData.swift
//  iExpense
//
//  Created by WeMa Mobile on 26/09/2024.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id: UUID
    var name: String
    var type: String
    var amount: Double

    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
