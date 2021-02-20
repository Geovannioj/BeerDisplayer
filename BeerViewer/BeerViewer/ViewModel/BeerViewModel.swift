//
//  BeerViewModel.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

protocol BeerViewModelProtocol: class {
    func getData(page: Int, perPage: Int, completionHandler: @escaping ((ResultStatus,[BeerModel]?) -> Void))
}

class BeerViewModel: BeerViewModelProtocol {
    var beers: [BeerModel] = [BeerModel]()
    var networkManager = NetworkManager()
    
    func getData(page: Int, perPage: Int, completionHandler: @escaping ((ResultStatus,[BeerModel]?) -> Void)) {
        networkManager.requestData(page: page, perPage: perPage) { (status, response) in
            if status == .success {
                if let response = response {
                    self.beers = response
                    completionHandler(.success, self.beers)
                }
            } else {
                completionHandler(.failure, nil)
            }
            
            
        }
    }
}
