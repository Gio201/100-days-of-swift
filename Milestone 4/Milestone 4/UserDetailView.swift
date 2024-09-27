//
//  UserDetailView.swift
//  Milestone 4
//
//  Created by WeMa Mobile on 27/09/2024.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Company: \(user.company)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)")
            Text("About: \(user.about)")
            Text("Joined Date: \(user.registered)")

            
            Section(header: Text("Friends")) {
                List(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .padding()
        .navigationTitle(user.name)
    }
}

#Preview {
    ContentView()
}
