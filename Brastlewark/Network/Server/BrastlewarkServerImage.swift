//
//  BrastlewarkServerImage.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation

class BrastlewarkServerImage {
    
    let session: URLSession = URLSession.shared
    
    func fetchImage(url urlString: String, completion: @escaping (_ data: Data?) -> ()) {
        guard let url: URL = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            if let _ = error {
                completion(nil)
                return
            }
            
            completion(data)
        }.resume()
    }
    
}
