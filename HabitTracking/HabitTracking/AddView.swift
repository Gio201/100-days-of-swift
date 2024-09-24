//
//  AddView.swift
//  HabitTracking
//
//  Created by WeMa Mobile on 24/09/2024.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                VStack {
                    Form {
                        Section(header: Text("Activity Details").font(.headline)) {
                            TextField("Title", text: $title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.body)

                            TextField("Description", text: $description)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.body)
                        }
                        .listRowBackground(Color.clear)
                    }
                    
                    .padding()
                    
                    HStack {
                        Button(action: {
                            dismiss() })
                        {
                            Text("Cancel")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            let newActivity = Activity(title: title, description: description)
                            activities.items.append(newActivity)
                            dismiss() })
                        {
                            Text("Save")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Add New Activity")
            .font(.largeTitle)
            .foregroundColor(.blue)
                    
        }
    }
}

#Preview {
    AddActivityView(activities: Activities())
}
