//
//  DetailViewControllerTests.swift
//  BeerViewerTests
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest
@testable import BeerViewer

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!
    var beers: [BeerModel]!
    
    override func setUpWithError() throws {
        let nib = UINib(nibName: "DetailViewController", bundle:nil)
        sut = nib.instantiate(withOwner: self, options: nil)[0] as? DetailViewController
        beers = JSONLoader().parseJSON()
        NetworkManager().getImage(beer: &beers[0])
        sut.beer = beers[0]
        sut?.viewDidLoad()
    }

    override func tearDownWithError() throws {
        sut = nil
        beers = nil
    }

    func testBeerData() throws {
        
        XCTAssertEqual(sut.titleLbl.text, beers[0].name)
        XCTAssertEqual(sut.beerDescription.text, beers[0].description!)
        XCTAssertEqual(sut.alcoholicRate.text, String(describing: beers[0].abv!))
        XCTAssertEqual(sut.bitterRate.text, String(describing: beers[0].ibu!))
        XCTAssertNotNil(sut.beer?.imgData)
    }

}
