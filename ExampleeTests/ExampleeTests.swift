//
//  ExampleeTests.swift
//  ExampleeTests
//
//  Created by Enes Urkan on 12/30/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import XCTest
@testable import Examplee

class ExampleeTests: XCTestCase {
    
    var searchVC : SearchViewController!
    var dummyHeaderTitle: [String]!

    override func setUp() {
        super.setUp()
        searchVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        dummyHeaderTitle = ["Books"]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        searchVC = nil
        dummyHeaderTitle = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let headerDTO = searchVC.getHeaderTitleData(titleData: dummyHeaderTitle)
        XCTAssertEqual(headerDTO.first?.title, "Books")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
