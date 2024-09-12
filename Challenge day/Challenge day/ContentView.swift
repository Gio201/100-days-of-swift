//
//  ContentView.swift
//  Challenge day
//
//  Created by WeMa Intern on 12/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperatureUnit: String = "Celsius"
    @State private var outputTemperatureUnit: String = "Fahrenheit"
    @State private var temp: Double = 0
    @FocusState private var isTenpSelected: Bool
    
    var convertedTemp: Double {
        var celsiusTemp: Double = 0
        
        switch inputTemperatureUnit {
        case "Celsius":
            celsiusTemp = temp
        case "Fahrenheit":
            celsiusTemp = (temp - 32) * 5/9
        case "Kelvin":
            celsiusTemp = temp - 273.15
        default: celsiusTemp = temp
            
        }
        
        switch outputTemperatureUnit {
        case "Celsius":
            return celsiusTemp
        case "Fahrenheit":
            return (celsiusTemp * 9/5) + 32
        case "Kelvin":
            return celsiusTemp + 273.15
        default:
            return celsiusTemp
        }
        
    }
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $temp, format: .number)
                }
                
                Section("Pick a unit - Input"){
                    Picker("Select unit", selection: $inputTemperatureUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Pick a unit - output"){
                    Picker("Select unit", selection: $outputTemperatureUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(convertedTemp.formatted())
                }
                
            }
            
            .navigationTitle("Temperature Calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


    
    #Preview {
        ContentView()
    }

