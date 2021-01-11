//
//  DeleteUserDefaultsValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class DeleteUserDefaultsValueInteractor {
    
    func execute(name: String) {
        let defaults: UserDefaults = UserDefaults()
        defaults.removeObject(forKey: name)
        defaults.synchronize()
    }
    
}
