//
//  ServerErrorModel.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

struct ServerErrorModel: Error, Codable {
    var reason: String?
    var error: Bool?
    
    init?() {
    }
}
