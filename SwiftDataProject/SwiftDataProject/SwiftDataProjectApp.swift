//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by WeMa Mobile on 26/09/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
