//
//  LocationView.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import SwiftUI
import MapKit

struct IdentifiableLocation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct LocationView: View {
    var location: CLLocationCoordinate2D
    
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    private var identifiableLocation: [IdentifiableLocation] {
        [IdentifiableLocation(coordinate: location)]
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion, annotationItems: identifiableLocation) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .frame(height: 300)
            .onAppear {
                mapRegion.center = location
            }
            
            Text("Latitude: \(location.latitude)")
            Text("Longitude: \(location.longitude)")
        }
        .navigationTitle("Uploaded Location")
        .padding()
    }
}
