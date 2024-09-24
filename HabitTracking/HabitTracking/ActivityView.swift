//
//  ActivityView.swift
//  HabitTracking
//
//  Created by WeMa Mobile on 24/09/2024.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    @ObservedObject var activities: Activities
    
    var body: some View {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()

            VStack(spacing: 20) {
                Text(activity.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)


                Text("Completed \(activity.completionCount) times")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Button(action: {
                    if let index = activities.items.firstIndex(of: activity) {
                        var updatedActivity = activities.items[index]
                        updatedActivity.completionCount += 1
                        activities.items[index] = updatedActivity
                    }
                })
            {
                    Text("Click to complete!")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
