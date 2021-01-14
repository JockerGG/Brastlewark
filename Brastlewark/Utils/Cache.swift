//
//  Cache.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation

class Cache {
    
    var cache: NSCache = NSCache<AnyObject, AnyObject>()
    
    static let shared: Cache = Cache()
    
    init() { }
    
}
