//
//  ContentView.swift
//  100daysofswiftui
//
//  Created by WeMa Intern on 09/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkamount / 100 * tipSelection
        let grandTotal = checkamount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkamount / 100 * tipSelection
        
        let grandTotal = checkamount + tipValue
        
        return grandTotal
        
    }
    

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR") )
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<21) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentages", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0) %")
                        }
                    }
   
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "EUR") )
                }
                
                Section("Total amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR") )
                    
                }
            }
            .navigationTitle("Project 1")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
