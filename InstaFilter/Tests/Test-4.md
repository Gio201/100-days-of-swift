//
//  ContentView.swift
//  InstaFilter
//
//  Created by WeMa Mobile on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
