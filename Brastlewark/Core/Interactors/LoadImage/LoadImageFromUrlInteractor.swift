//
//  LoadImageFromUrlInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation

class LoadImageFromUrlInteractor {
    
    func execute(url: String, completion: @escaping (_ image: Data?) -> ()) {
        BrastlewarkServerImage().fetchImage(url: url, completion: completion)
    }
    
}
