//
//  DetailView.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import SwiftUI
import MapKit

struct DetailView: View {
    let photo: PhotoItem
    let locationFetcher = LocationFetcher()
    
    @State private var showingLocationView = false
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    var body: some View {
        if let uiImage = UIImage(data: photo.imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .navigationTitle(photo.name)
                .padding()
        } else {
            ContentUnavailableView("Unable to load Picture", systemImage: "photo.badge.exclamationmark.fill", description: Text("Try again later."))
                .foregroundStyle(.black, .red)
        }
        
        Button("Start Tracking Location") {
            locationFetcher.start()
        }
        .buttonStyle(GrowingButton())
        
        Button("Read Location") {
            if let location = locationFetcher.lastKnownLocation {
                selectedLocation = location
                showingLocationView = true
            } else {
                print("Your location is unknown")
            }
        }
        .buttonStyle(GrowingButton())
        .sheet(isPresented: $showingLocationView) {
            if let location = selectedLocation {
                LocationView(location: location)
            }
        }
    }
}


#Preview {
    DetailView(photo: PhotoItem(name: "Test", imageData: Data()))
}


