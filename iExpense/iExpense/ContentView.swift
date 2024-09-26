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
    @State private var selectedFilter = "All"

    let filters = ["All", "Personal", "Business"]

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(filteredExpenses) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, from: filteredExpenses)
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
        }
        .modelContainer(for: [ExpenseItem.self])
    }

    var filteredExpenses: [ExpenseItem] {
        switch selectedFilter {
        case "Personal":
            return personalExpenses
        case "Business":
            return businessExpenses
        default:
            return expenses
        }
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
