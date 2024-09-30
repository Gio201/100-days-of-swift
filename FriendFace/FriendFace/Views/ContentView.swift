//
//  ContentView.swift
//  FriendFace
//
//  Created by WeMa Mobile on 27/09/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Image(user.isActive ? "useractive" : "userdeactive")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text(user.name)
                    }
                }
            }
            
            .navigationTitle("FriendFace")
            .task {
                if let retrievedUsers = await getUsers() {
                    users = retrievedUsers
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
