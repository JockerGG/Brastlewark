//
//  GetPopulationInteractor.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import RxSwift

class GetPopulationInteractor {
    
    func execute() -> Observable<Population> {
        if let data: CacheData<Population> = GetUserDefaultsValueInteractor().execute(name: UserDefaultsConstants.populationCache),
           let object: Population = data.object,
           ValidateCacheDateWorker().execute(cacheDate: data.date) {
            return .just(object)
        }
        
        return PopulationAPI().getPopulation().map { data in
            var cacheObject: CacheData<Population> = CacheData()
            cacheObject.object = data
            
            DeleteUserDefaultsValueInteractor().execute(name: UserDefaultsConstants.populationCache)
            SetUserDefaultsValueInteractor().execute(name: UserDefaultsConstants.populationCache, value: cacheObject.toJSONString())
            
            return data
        }
    }
    
}
