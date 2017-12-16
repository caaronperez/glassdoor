//
//  GlassdorTests.swift
//  GlassdorTests
//
//  Created by MCS Devices on 11/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import XCTest
@testable import Glassdor

class GlassdorTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // to ensure every test starts with a clean slate.
        sessionUnderTest = nil
        
        super.tearDown()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToFlightsGetsHTTPStatusCode200() {
        // given
        let urlString = "http://api.glassdoor.com/api/api.htm?t.p=226784&t.k=egJHs4O7iCI&userip=0.0.0.0&useragent=&format=json&v=1&action=employers"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: request) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Asynchronous test: faster fail
    func testCallToFlightsCompletes() {
        // given
        let urlString = "http://api.glassdoor.com/api/api.htm?t.p=226784&t.k=egJHs4O7iCI&userip=0.0.0.0&useragent=&format=json&v=1&action=employers"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: request) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
