//
//  ContentView.swift
//  BucketList
//
//  Created by WeMa Mobile on 01/10/2024.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 53, longitude: 5.4),
            span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    @State private var isMapStyleSheetPresented = false
    @State private var selectedMapStyle: MapStyle = .standard(elevation: .realistic)
    
        var body: some View {
            if viewModel.isUnlocked {
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    viewModel.selectedPlace = location
                                }
                        }
                    }
                }
                .mapStyle(selectedMapStyle)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
                HStack(spacing: 50){
                    Button("Standard") {
                        selectedMapStyle = .standard(elevation: .realistic)
                        isMapStyleSheetPresented = false
                    }
                    .padding()
                    
                    Button("Hybrid") {
                        selectedMapStyle = .hybrid(elevation: .realistic)
                        isMapStyleSheetPresented = false
                    }
                }
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
