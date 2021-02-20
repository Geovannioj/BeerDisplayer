//
//  NetworkManager.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import Alamofire

enum ResultStatus {
    case success
    case failure
}

protocol NetworkProtocol {
    func requestData(page: Int, perPage: Int, completionHandler: @escaping ((ResultStatus,[BeerModel]?) -> Void))
}

class NetworkManager: NetworkProtocol {
    var response: [BeerModel] = [BeerModel]()
    private let group = DispatchGroup()
    
    func requestData(page: Int, perPage: Int, completionHandler: @escaping ((ResultStatus,[BeerModel]?) -> Void)) {

          let parameters = ["page": "\(page)",
                            "per_page": "\(perPage)"]
    
          group.enter()
          
          AF.request("https://api.punkapi.com/v2/beers?",
                     method: .get,
                     parameters: parameters).validate().responseDecodable(of: [BeerModel].self) { (response) in
                      
                        self.group.leave()
                        print(response)
                        guard var responseContent = response.value else { completionHandler(.failure, nil); return }
                        self.getImagesFromResponse(responseArray: &responseContent)
                        completionHandler(.success, responseContent)
                        
          }
              
    }
    
    func getImagesFromResponse(responseArray: inout [BeerModel]) {
        
        for index in 0..<responseArray.count {
            getImage(beer: &responseArray[index])
        }
    }
    
    func getImage( beer: inout BeerModel) {
        if let imgUrl = URL(string: beer.imgUrl ?? String()) {
            beer.imgData = downloadImage(from: imgUrl)
        }
    }
    
    func downloadImage(from url: URL) -> Data {
        var imageData: Data?
        group.enter()
        imageData = try? Data(contentsOf: url)
        self.group.leave()
        return imageData ?? Data()
    }

}
