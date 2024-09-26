//
//  ContentView.swift
//  iExpense
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftData
import SwiftUI
import Foundation

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var expenses: [ExpenseItem]
    @State private var isAddingExpense = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Personal Expenses")) {
                    ForEach(personalExpenses) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, from: personalExpenses)
                    }
                }
                
                Section(header: Text("Business Expenses")) {
                    ForEach(businessExpenses) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, from: businessExpenses)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .modelContainer(for: [ExpenseItem.self])
    }

    var personalExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Personal" }
    }

    var businessExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Business" }
    }

    @ViewBuilder
    func expenseRow(for item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)

                Text(item.type)
            }

            Spacer()

            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                .foregroundColor(item.amount < 10 ? .green : (item.amount < 100) ? .blue : .red)
        }
    }

    func removeItems(at offsets: IndexSet, from filteredArray: [ExpenseItem]) {
        for offset in offsets {
            if let index = filteredArray.firstIndex(where: { $0.id == filteredArray[offset].id }) {
                modelContext.delete(filteredArray[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
