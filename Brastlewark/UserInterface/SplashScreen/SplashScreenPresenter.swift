//
//  SplashScreenPresenter.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

protocol SplashScreenPresenterView {
    func didLoadData(data: Population)
    func didLoadDataError(error: String?)
}

class SplashScreenPresenter {
    var view: SplashScreenPresenterView?
    
    init(view: SplashScreenPresenterView?) {
        self.view = view
    }
    
    func loadData() {
        GetPopulationInteractor().execute( { [weak self] (response) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    var cacheObject: CacheData<Population> = CacheData()
                    cacheObject.object = data
                    
                    SetUserDefaultsValueInteractor().execute(name: UserDefaultsConstants.populationCache, value: cacheObject)
                    
                    self.view?.didLoadData(data: data)
                case .error(let error):
                    self.view?.didLoadDataError(error: error.localizedDescription)
                }
            }
        })
    }
    
}
