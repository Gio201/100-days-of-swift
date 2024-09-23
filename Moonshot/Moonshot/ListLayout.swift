//
//  ListLayout.swift
//  Moonshot
//
//  Created by WeMa Mobile on 23/09/2024.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.top, -5)
                        }
                    }
                }
                .padding([.leading, .trailing])
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.lightBackground)
                )
            }
        }
        .navigationTitle("Moonshot")
        .listStyle(.plain)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
    }
}

