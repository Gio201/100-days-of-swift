//
//  ContentView.swift
//  HotProspects
//
//  Created by WeMa Mobile on 07/10/2024.
//

import UserNotifications
import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    ContentView()
}
