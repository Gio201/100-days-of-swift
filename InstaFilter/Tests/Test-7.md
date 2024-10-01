//
//  ContentView.swift
//  InstaFilter
//
//  Created by WeMa Mobile on 01/10/2024.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
