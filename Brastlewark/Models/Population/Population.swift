//
//  Population.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

struct Population: Codable {
    var population: [Gnome] = []
    
    private enum CodingKeys: String, CodingKey {
        case population = "Brastlewark"
    }
}
