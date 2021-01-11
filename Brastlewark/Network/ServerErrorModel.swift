//
//  ServerErrorModel.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

struct ServerErrorModel: Error, Mappable {
    var reason: String?
    var error: Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        reason <- map["reason"]
        error <- map["error"]
    }
}
