//
//  BookwormApp.swift
//  Bookworm
//
//  Created by WeMa Mobile on 25/09/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
