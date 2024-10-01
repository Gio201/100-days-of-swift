//
//  ContentView.swift
//  InstaFilter
//
//  Created by WeMa Mobile on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello world") {
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Blue") { backgroundColor = .blue }
            Button("Green") { backgroundColor = .green }
            Button("Yellow") { backgroundColor = .yellow }
            Button("Orange") { backgroundColor = .orange }
            Button("Pink") { backgroundColor = .pink }
            Button("Purple") { backgroundColor = .purple}
            Button("Clack") { backgroundColor = .black }
            Button("Cyan") { backgroundColor = .cyan }
            Button("Brown") { backgroundColor = .brown }
            Button("Indigo") { backgroundColor = .indigo }
            Button("Teal") { backgroundColor = .teal }
            Button("Accent") { backgroundColor = .accentColor }
            Button("Mint") { backgroundColor = .mint }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color.")
        }
    }
}

#Preview {
    ContentView()
}
