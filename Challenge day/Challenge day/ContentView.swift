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

    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $temp, format: .number)
                    
                    
                }
            }
        }
    }
}


    
    #Preview {
        ContentView()
    }

