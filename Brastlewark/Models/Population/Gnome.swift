//
//  Gnome.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

struct Gnome: Codable {
    var id: Int = 0
    var name: String?
    var thumbnail: String?
    var age: Int?
    var weight: Double?
    var height: Double?
    var hairColor: String?
    var professions: [String] = []
    var friends: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case age
        case weight
        case height
        case hairColor = "hair_color"
        case professions
        case friends
    }
}
