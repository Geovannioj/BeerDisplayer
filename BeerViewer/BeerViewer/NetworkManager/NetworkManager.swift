//
//  NetworkManager.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    
}

class NetworkManager: NetworkProtocol {
    
    func parseJSON() {
        if let path = Bundle.main.path(forResource: "modelJSON", ofType: "json") {
            do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([BeerModel].self, from: data)
                print(jsonData[0].name)
//                  let decoder = JSONDecoder()
//                  let jsonData = try decoder.decode(BeerModel.self, from: data)
                    
                
              } catch {
                   print("Error parsing")
              }
        }
    }
}
