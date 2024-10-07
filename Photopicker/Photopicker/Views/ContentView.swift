//
//  ContentView.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import PhotosUI
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = PhotoLibraryViewModel()
    @State private var selectedItem: PhotosPickerItem?
    @State private var showNameAlert = false
    @State private var newPhotoName = ""
    @State private var newPhotoData: Data?

    var body: some View {
        NavigationView {
            VStack {
                PhotosPicker("Select Image", selection: $selectedItem, matching: .images)
                    .padding()
                List(viewModel.photos) { photo in
                    NavigationLink(destination: DetailView(photo: photo)) {
                        HStack {
                            if let uiImage = UIImage(data: photo.imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            Text(photo.name)
                        }
                    }
                }
                .navigationTitle("Photo Library")
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        newPhotoData = data
                        showNameAlert = true
                    } else {
                        print("Failed to load photo data")
                    }
                }
            }
            .alert("Name the photo", isPresented: $showNameAlert, actions: {
                TextField("Enter name", text: $newPhotoName)
                Button("OK") {
                    if let imageData = newPhotoData {
                        let newPhoto = PhotoItem(name: newPhotoName, imageData: imageData)
                        viewModel.addPhoto(newPhoto)
                    }
                    newPhotoName = ""
                }
            }, message: {
                Text("Please give a name to the photo.")
            })
        }
    }
     func delete(at offsets: IndexSet) {
        newPhotoData?.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
