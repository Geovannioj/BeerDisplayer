//
//  NetworkManagerTests.swift
//  BeerViewerTests
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest
@testable import BeerViewer

class NetworkManagerTests: XCTestCase {

    var sut: NetworkManager!
    override func setUpWithError() throws {
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testRequestData() throws {
        let exp = expectation(description: "Alamofire")
        
         sut.requestData(page: 1, perPage: 1) { (result, model) in
                   if result == .success {
                       XCTAssertNotNil(model)
                   } else {
                       XCTAssertNil(model)
                   }
            exp.fulfill()
       }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
