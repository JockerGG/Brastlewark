//
//  CacheData.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

struct CacheData<T: Codable>: Codable {
    
    var object: T?
    var date: Date = Date()
    
    init() { }
    
}
