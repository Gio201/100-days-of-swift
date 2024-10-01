//
//  ContentView.swift
//  InstaFilter
//
//  Created by WeMa Mobile on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Space", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
