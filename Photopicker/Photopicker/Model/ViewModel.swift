//
//  ViewModel.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import Foundation
import SwiftUI

@MainActor class PhotoLibraryViewModel: ObservableObject {
    @Published var photos: [PhotoItem] = []
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("photos.json")
    
    init() {
        loadPhotos()
    }
    
    func addPhoto(_ photo: PhotoItem) {
        photos.append(photo)
        photos.sort()
        savePhotos()
    }
    
    private func savePhotos() {
        if let data = try? JSONEncoder().encode(photos) {
            try? data.write(to: savePath)
        }
    }
    
    private func loadPhotos() {
        if let data = try? Data(contentsOf: savePath),
           let savedPhotos = try? JSONDecoder().decode([PhotoItem].self, from: data) {
            photos = savedPhotos
        }
    }
}
