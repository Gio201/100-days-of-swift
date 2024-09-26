//
//  iExpenseApp.swift
//  iExpense
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ExpenseItem.self])
        }
    }
}
