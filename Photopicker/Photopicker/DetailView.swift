//
//  DetailView.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import SwiftUI

struct DetailView: View {
    let photo: PhotoItem

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
    }
}

#Preview {
    DetailView(photo: PhotoItem(name: "Test", imageData: Data()))
}
