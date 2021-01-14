//
//  SetUserDefaultsValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class SetUserDefaultsValueInteractor {
    
    func execute<T>(name: String, value: T) where T: Encodable {
        guard let data: Data = try? JSONEncoder().encode(value),
              let jsonString: String = String(data: data, encoding: .utf8) else { return }
        let defaults: UserDefaults = UserDefaults()
        
        defaults.setValue(jsonString, forKey: name)
        defaults.synchronize()
    }
    
}
