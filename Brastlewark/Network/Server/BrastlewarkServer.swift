//
//  BrastlewarkServer.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class BrastlewarkServer<T: Codable> {
    
    enum BrastlewarkServerResponse {
        case success(data: T)
        case error(error: Error)
    }
    
    let session: URLSession = URLSession.shared
    
    func loadRequest(_ request: URLRequest, completion: @escaping (_ response: BrastlewarkServerResponse) -> ()) {
        session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                completion(.error(error: error))
                return
            }
            
            do {
                try self?.checkForServerError(response: response)
            
                guard let data = data else {
                    completion(.error(error:  BrastlewarkServerError.parseError))
                    return
                }
                
                let result: T = try JSONDecoder().decode(T.self, from: data)
                                
                completion(.success(data: result))
            } catch {
                completion(.error(error: error))
            }
        }.resume()
    }
    
    private func checkForServerError(response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw BrastlewarkServerError.parseError
        }
        
        let statusCode: Int = httpResponse.statusCode
        
        guard statusCode < 400 else {
            throw BrastlewarkServerError.serverError(nil)
        }
    }
}
