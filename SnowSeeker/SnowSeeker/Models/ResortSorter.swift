//
//  ResortSorter.swift
//  SnowSeeker
//
//  Created by WeMa Mobile on 24/10/2024.
//

import Foundation

enum SortType: String, CaseIterable, Identifiable {
    case `default` = "Default"
    case alphabetical = "Alphabetical"
    case country = "Country"
    
    var id: String { self.rawValue }
}


struct ResortSorter {
    static func sort(resorts: [Resort], by sortType: SortType) -> [Resort] {
        switch sortType {
        case .default:
            return resorts
        case .alphabetical:
            return resorts.sorted { $0.name < $1.name }
        case .country:
            return resorts.sorted { $0.country < $1.country }
        }
    }
}

