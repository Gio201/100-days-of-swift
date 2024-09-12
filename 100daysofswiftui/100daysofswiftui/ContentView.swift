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
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR") )
                        .keyboardType(.decimalPad)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<21) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR") )
                }
            }
            .navigationTitle("Project 1")
        }
    }
}


#Preview {
    ContentView()
}
