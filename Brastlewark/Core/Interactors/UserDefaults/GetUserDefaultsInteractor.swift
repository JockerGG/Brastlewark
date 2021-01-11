//
//  GetUserDefaultsValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

class GetUserDefaultsValueInteractor<T: Mappable> {
    
    func execute(name: String) -> T? {
        let defaults: UserDefaults = UserDefaults()
        guard let jsonString: String = defaults.string(forKey: name) else { return nil }
        
        return Mapper<T>().map(JSONString: jsonString)
    }
    
}
