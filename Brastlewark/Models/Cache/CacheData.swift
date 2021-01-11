//
//  CacheData.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

struct CacheData<T: Mappable>: Mappable {
    
    var object: T?
    var date: Date = Date()
    
    init() { }
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        object <- map["object"]
        date <- map["date"]
    }
}
