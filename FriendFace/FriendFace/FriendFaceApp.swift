//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by WeMa Mobile on 27/09/2024.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Friend.self])
    }
}
