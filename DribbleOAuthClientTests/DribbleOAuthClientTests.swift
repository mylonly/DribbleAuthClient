//
//  DribbleOAuthClientTests.swift
//  DribbleOAuthClientTests
//
//  Created by 田祥根 on 16/7/27.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import XCTest
import Result
@testable import DribbleOAuthClient

class DribbleOAuthClientTests: XCTestCase {
    
    let client:DribbleClient = DribbleClient()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
       
    }
    
    func testShotsList(){
        let expec = expectation(description: "testShotsList")
        client.fetchShotsList(list: ShotsListType.animated, timeFrame: ShotsListTimeFrame.month, date: nil, sort: ShotsListSort.comments).startWithResult { result in
            XCTAssert(result.error == nil)
            expec.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    func testShot(){
        let expec = expectation(description: "testShot")
        client.fetcShotWithID(471756).startWithResult { result in
            XCTAssert(result.value?.id != nil)
            expec.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
