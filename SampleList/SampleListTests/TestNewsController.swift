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
    
    func testLoadNews() {
        let controller = NewsController()
        controller.newsAPI = newsMock1()
        controller.loadNews { (data, error) in
            XCTAssertTrue(data?.count == 3)
        }
        
        controller.newsAPI = newsMock2()
        controller.loadNews { (data, error) in
            let item = data?.last
            XCTAssertTrue(item?.title! == "Hello")
            XCTAssertNil(item?.description)
            XCTAssertNil(item?.image)
        }
        
        controller.newsAPI = newsMock3()
        controller.loadNews { (data, error) in
            XCTAssertTrue(data?.count == 1)
            let item = data?.last
            XCTAssertTrue(item?.title! == "Pickle")
            XCTAssertTrue(item?.description! == "Rick")
            XCTAssertTrue(item?.image! == "http://google.com")

        }
    }
    
}

class newsMock1:APIProtocol {
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "mock1", ofType: "json") {
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

class newsMock2:APIProtocol {
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "mock2", ofType: "json") {
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

class newsMock3:APIProtocol {
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "mock2", ofType: "json") {
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

