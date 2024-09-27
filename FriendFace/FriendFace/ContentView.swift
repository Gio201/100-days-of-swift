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
    
    func getUsers() async -> [User]? {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try decoder.decode([User].self, from: data)
            return decodedData
        } catch {
            print(error)
        }
        return nil
    }
}

#Preview {
    ContentView()
}
