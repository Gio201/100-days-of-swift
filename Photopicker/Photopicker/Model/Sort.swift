//
//  Photo.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import SwiftUI

struct PhotoItem: Identifiable, Codable, Comparable {
    var id = UUID()
    var name: String
    var imageData: Data
    
    static func < (lhs: PhotoItem, rhs: PhotoItem) -> Bool {
        lhs.name < rhs.name
    }
}
