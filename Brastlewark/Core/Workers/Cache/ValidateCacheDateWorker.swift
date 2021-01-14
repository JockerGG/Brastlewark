//
//  ValidateCacheDateWorker.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class ValidateCacheDateWorker {
    
    func execute(cacheDate: Date) -> Bool {
        let date: Date = cacheDate.addingTimeInterval(5 * 60)
        return date >= Date()
    }
    
}
