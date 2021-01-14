//
//  PopulationAPI.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class PopulationAPI {
    
    func getPopulation(completion: @escaping (BrastlewarkServer<Population>.BrastlewarkServerResponse) -> ()) {
        let endpoint: Endpoint = Endpoint(
            baseUrl: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json",
            httpMethod: "GET"
        )
        
        return BrastlewarkServer<Population>().loadRequest(endpoint.buildRequest(), completion: completion)
    }
    
}
