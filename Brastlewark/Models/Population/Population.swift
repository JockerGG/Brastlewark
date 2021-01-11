//
//  Population.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

struct Population: Mappable {
    var population: [Gnome] = []
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        population <- map["Brastlewark"]
    }
}
