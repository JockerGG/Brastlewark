//
//  GetCacheValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation

class GetCacheValueInteractor<T> {
    
    func execute(key: String) -> T? {
        let value: AnyObject? = Cache.shared.cache.object(forKey: key as AnyObject)
        
        return value as? T
    }
    
}
