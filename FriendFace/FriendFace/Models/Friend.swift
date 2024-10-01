//
//  Friend.swift
//  FriendFace
//
//  Created by WeMa Mobile on 30/09/2024.
//

import Foundation
import SwiftData

@Model
class Friend: Identifiable, Codable {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
