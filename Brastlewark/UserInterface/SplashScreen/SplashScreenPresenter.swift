//
//  SplashScreenPresenter.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import RxSwift

protocol SplashScreenPresenterView {
    func didLoadData(data: Population)
    func didLoadDataError(error: String?)
}

class SplashScreenPresenter {
    
    var view: SplashScreenPresenterView?
    let disposeBag: DisposeBag = DisposeBag()
    
    init(view: SplashScreenPresenterView?) {
        self.view = view
    }
    
    func loadData() {
        GetPopulationInteractor().execute()
            .subscribe( onNext: { [weak self] data in
                self?.view?.didLoadData(data: data)
            }, onError: { [weak self] error in
                self?.view?.didLoadDataError(error: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
}
