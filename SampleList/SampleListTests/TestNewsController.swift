//
//  TestNewsController.swift
//  SampleListTests
//
//  Created by Santos Ramon on 3/5/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import XCTest
import SwiftyJSON

class TestNewsController: XCTestCase {
    let controller = NewsController()

    func testLoadNews() {
        let mockAPI = MockAPI()
        mockAPI.filename = "mock1"
        controller.newsAPI = mockAPI
        controller.loadNews { (data, error) in
            XCTAssertTrue(data?.count == 3)
        }

        mockAPI.filename = "mock2"
        controller.loadNews { (data, error) in
            let item = data?.last
            XCTAssertTrue(item?.title! == "Hello")
            XCTAssertNil(item?.description)
            XCTAssertNil(item?.image)
        }
        
        mockAPI.filename = "mock3"
        controller.loadNews { (data, error) in
            XCTAssertTrue(data?.count == 2)
            let item = data?.first
            XCTAssertTrue(item?.title! == "Pickle")
            XCTAssertTrue(item?.description! == "Rick")
            XCTAssertTrue(item?.image! == "http://google.com")

        }
        
    }
    
}

class MockAPI:APIProtocol {
    var filename = "mock1"
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                completion(jsonObj, nil)
            } catch {
                // handle error
            }
        }
    }
    
}


