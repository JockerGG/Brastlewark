//
//  SplashScreenViewController.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    lazy var presenter: SplashScreenPresenter = {
        SplashScreenPresenter(view: self)
    }()
    
    static func instantiate() -> SplashScreenViewController {
        return SplashScreenViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        
        presenter.loadData()
    }
    
}

extension SplashScreenViewController: SplashScreenPresenterView {
    func didLoadData(data: Population) {
        let nextController: PopulationListViewController = PopulationListViewController.instantiate(data: data)
        self.navigationController?.setViewControllers([nextController], animated: true)
    }
    
    func didLoadDataError(error: String?) {
        let alertController: UIAlertController = UIAlertController(title: "Error loading data", message: error, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Try again", style: .default) { [weak self] (_) in
            self?.presenter.loadData()
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
