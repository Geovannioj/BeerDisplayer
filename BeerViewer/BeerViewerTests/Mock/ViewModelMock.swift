//
//  ViewModelMock.swift
//  BeerViewerTests
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
@testable import BeerViewer

class ViewModelMock: BeerViewModelProtocol {
    func getData(page: Int, perPage: Int, completionHandler: @escaping ((ResultStatus, [BeerModel]?) -> Void)) {
        
        completionHandler(.success, JSONLoader().parseJSON())
    }
    
    
}
