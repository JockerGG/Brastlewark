//
//  Gnome.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

struct Gnome: Mappable {
    var id: Int = 0
    var name: String?
    var thumbnail: String?
    var age: Int?
    var weight: Double?
    var height: Double?
    var hairColor: String?
    var professions: [String] = []
    var friends: [String] = []
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        thumbnail <- map["thumbnail"]
        age <- map["age"]
        weight <- map["weight"]
        height <- map["height"]
        hairColor <- map["hair_color"]
        professions <- map["professions"]
        friends <- map["friends"]
    }
    
}
