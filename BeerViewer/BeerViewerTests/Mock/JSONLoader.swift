//
//  ViewModelMocked.swift
//  BeerViewerTests
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
@testable import BeerViewer

class JSONLoader {
    
    func parseJSON() -> [BeerModel] {
        var beers: [BeerModel] = [BeerModel]()
            if let path = Bundle(for: type(of: self)).path(forResource: "modelJSON", ofType: "json" ) {
             do {
                     let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                     let decoder = JSONDecoder()
                     let jsonData = try decoder.decode([BeerModel].self, from: data)
                     print(jsonData[0].name)
                     beers = jsonData

               } catch {
                    print("Error parsing")
               }
         }

        return beers
     }
}
