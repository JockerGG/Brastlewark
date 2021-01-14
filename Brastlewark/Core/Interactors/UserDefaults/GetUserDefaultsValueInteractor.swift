//
//  GetUserDefaultsValueInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class GetUserDefaultsValueInteractor<T: Codable> {
    
    func execute(name: String) -> T? {
        let defaults: UserDefaults = UserDefaults()
        guard let jsonString: String = defaults.string(forKey: name),
              let data: Data = jsonString.data(using: .utf8) else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
}
