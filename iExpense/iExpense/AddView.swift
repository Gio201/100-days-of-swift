//
//  ContentView.swift
//  iExpense
//
//  Created by WeMa Mobile on 20/09/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    @ObservedObject var expenses: Expenses

    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .keyboardType(.decimalPad)

                Button("Save") {
                    saveExpense()
                }
                .disabled(name.isEmpty || amount <= 0)
            }
            .navigationTitleField($name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    func saveExpense() {
        let newItem = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(newItem)
        dismiss()
    }
}

extension View {
    func navigationTitleField(_ binding: Binding<String>) -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                TextField("Expense Name", text: binding)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
