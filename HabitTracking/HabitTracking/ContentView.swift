//
//  ContentView.swift
//  HabitTracking
//
//  Created by WeMa Mobile on 23/09/2024.
//

import SwiftUI

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount: Int = 0
}

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode([Activity].self, from: savedItems) {
                self.items = decodedItems
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()

                VStack {
                    Text("Habit Tracker")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.blue)
                        .padding(.top)
                    
                    if activities.items.isEmpty {
                        Text("No activities yet. Start tracking!")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List {
                            ForEach(activities.items) { activity in
                                NavigationLink(destination: ActivityDetailView(activity: activity, activities: activities)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(activity.title)
                                                .font(.headline)
                                                .foregroundColor(.blue)
                                            
                                            Text("Completed \(activity.completionCount) times")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
    
                                        .padding(.vertical, 8)
                                    }
                                }
                            }
                            .onDelete(perform: deleteItem)
                        }
                        .listStyle(GroupedListStyle())
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .toolbar {
                    Button(action: {
                        showingAddActivity = true
                    }) { 
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .sheet(isPresented: $showingAddActivity) {
                    AddActivityView(activities: activities)
                }
            }
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        activities.items.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}
