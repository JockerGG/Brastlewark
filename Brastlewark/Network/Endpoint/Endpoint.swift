//
//  Endpoint.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class Endpoint {
    var baseUrl: String
    var httpMethod: String
    
    init(
        baseUrl: String,
        httpMethod: String
    ) {
        self.baseUrl = baseUrl
        self.httpMethod = httpMethod
    }
    
    func buildRequest() -> URLRequest {
        return createRequest(
            url: URL(string: baseUrl)!,
            httpMethod: httpMethod
        )
    }
}

extension Endpoint {
    
    func createRequest(url: URL, httpMethod: String) -> URLRequest {
        let mutableURLRequest = NSMutableURLRequest(url: url)
        mutableURLRequest.httpMethod = httpMethod
        
        return mutableURLRequest as URLRequest
    }
    
}
