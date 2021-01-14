//
//  PopulationListViewController.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import UIKit

class PopulationListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var data: Population?
    
    lazy var presenter: PopulationListPresenter = {
        PopulationListPresenter(data: data)
    }()
    
    static func instantiate(data: Population) -> PopulationListViewController {
        let controller: PopulationListViewController = PopulationListViewController()
        controller.data = data
        
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        self.title = "Population"
        collectionView.register(UINib(nibName: "GnomeCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
    }
    
}

extension PopulationListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: GnomeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GnomeCell,
              let model: Gnome = presenter.getGnomeData(at: indexPath.item) else {
            fatalError()
        }
        cell.configure(model: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let gnome: Gnome = presenter.getGnomeData(at: indexPath.item) else { return }
        
        let nextController: GnomeDetailViewController = GnomeDetailViewController.instantiate(details: gnome)
        
        self.present(nextController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
