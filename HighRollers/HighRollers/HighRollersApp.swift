//
//  HighRollersApp.swift
//  HighRollers
//
//  Created by WeMa Mobile on 21/10/2024.
//

import SwiftData
import SwiftUI

@main
struct HighRollersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Roll.self])
        }
    }
}
