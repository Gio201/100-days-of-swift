//
//  ContentView.swift
//  iExpense
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftUI
import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}


struct ContentView: View {
    @StateObject private var expenses = Expenses()

    @State private var showingAddExpense = false

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
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }

    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
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
            if let index = expenses.items.firstIndex(where: { $0.id == filteredArray[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }
}

#Preview {
    ContentView()
}
