//
//  PopulationAPI.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import RxSwift
import ObjectMapper

class PopulationAPI {
    
    func getPopulation() -> Observable<Population> {
        let endpoint: Endpoint = Endpoint(
            baseUrl: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json",
            httpMethod: "GET"
        )
        
        return BrastlewarkServer<Population>().loadRequest(endpoint.buildRequest())
    }
    
}
