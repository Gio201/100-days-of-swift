//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by WeMa Mobile on 17/10/2024.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
