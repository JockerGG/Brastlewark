//
//  GetPopulationInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class GetPopulationInteractor {
    
    func execute(_ completion: @escaping (BrastlewarkServer<Population>.BrastlewarkServerResponse) -> ()) {
        if let data: CacheData<Population> = GetUserDefaultsValueInteractor<CacheData<Population>>().execute(name: UserDefaultsConstants.populationCache),
           let object: Population = data.object,
           ValidateCacheDateWorker().execute(cacheDate: data.date) {
            completion(.success(data: object))
            return
        }
        
        PopulationAPI().getPopulation(completion: completion)
    }
    
}
