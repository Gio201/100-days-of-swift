//
//  DetailView.swift
//  FriendFace
//
//  Created by WeMa Mobile on 27/09/2024.
//

import SwiftData
import SwiftUI


struct DetailView: View {
    
    let user: User
    
    var body: some View {
        List {
            Section {
                Text("Registered: \(user.formattedDate)")
                Text("Age: \(user.age)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("Works for: \(user.company)")
            } header: {
                Text("Basic Info")
            }
            
            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
            
            Section {
                Text(user.isActive ? "\(user.name) is active" : "\(user.name) is not active")
            } header: {
                Text("Currently active?")
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
#Preview {
    ContentView()
}
