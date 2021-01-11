//
//  PopulationListPresenter.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

class PopulationListPresenter {
    
    var data: Population?
    
    init(data: Population?) {
        self.data = data
    }
    
    func getItemsCount() -> Int {
        guard let population = data?.population else { return 0 }
        
        return  population.count
    }
    
    func getGnomeData(at index: Int) -> Gnome? {
        guard let population = data?.population else { return nil }
        
        return population[index]
    }
    
}
