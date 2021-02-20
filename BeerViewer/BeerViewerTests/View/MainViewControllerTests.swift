//
//  MainViewControllerTests.swift
//  BeerViewerTests
//
//  Created by Geovanni Oliveira de Jesus on 20/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest
@testable import BeerViewer

class MainViewControllerTests: XCTestCase {

    var sut: MainViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "MainViewController") as MainViewController
        
        sut.loadViewIfNeeded()
        sut.viewDidLoad()
        sut.beerViewModel = ViewModelMock()
        sut.beers = JSONLoader().parseJSON()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testBeersNotNil() throws {
        XCTAssertNotNil(sut.beers)
    }
    
    func testPresentDetailView() {
        sut.viewDidLoad()
        sut.beers = JSONLoader().parseJSON()
        sut.presentDetailView(beerIndex: 0)
        XCTAssertNil(sut.presentedViewController)

    }
    
    func testHasATableView() {
           XCTAssertNotNil(sut.tableView)
       }
       
       func testTableViewHasDelegate() {
           XCTAssertNotNil(sut.tableView.delegate)
       }
       
       func testTableViewConfromsToTableViewDelegateProtocol() {
           XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
           XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
       }
       
       func testTableViewHasDataSource() {
           XCTAssertNotNil(sut.tableView.dataSource)
       }
       
       func testTableViewConformsToTableViewDataSourceProtocol() {
           XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
//           XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
           XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
           XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
       }

       func testTableViewCellHasReuseIdentifier() {
           let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CustomTableViewCell
           let actualReuseIdentifer = cell?.reuseIdentifier
           let expectedReuseIdentifier = "cell"
           XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
       }
}
