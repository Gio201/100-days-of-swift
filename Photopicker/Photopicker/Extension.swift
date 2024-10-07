//
//  Extension.swift
//  Photopicker
//
//  Created by WeMa Mobile on 07/10/2024.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
