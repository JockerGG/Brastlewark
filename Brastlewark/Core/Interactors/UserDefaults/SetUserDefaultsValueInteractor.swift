//
//  SetUserDefaultsValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class SetUserDefaultsValueInteractor {
    
    func execute(name: String, value: String?) {
        guard let value = value else { return }
        let defaults: UserDefaults = UserDefaults()
        
        defaults.setValue(value, forKey: name)
        defaults.synchronize()
    }
    
}
