//
//  SetCacheValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation

class SetCacheValueInteractor {
    
    func execute(key: String, value: AnyObject) {
        Cache.shared.cache.setObject(value, forKey: key as AnyObject)
    }
    
}
