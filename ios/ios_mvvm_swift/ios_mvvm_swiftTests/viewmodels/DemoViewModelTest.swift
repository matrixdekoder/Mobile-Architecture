//
//  DemoViewModelTest.swift
//  ios_mvvm_swiftTests
//
//  Created by Phạm Như Vũ on 10/26/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import XCTest
@testable import ios_mvvm_swift

class DemoViewModelTest: XCTestCase {

    var demoViewModel: DemoViewModel!
    
    override func setUp() {
        demoViewModel = DemoViewModel(demoRepository: DemoRepository())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIncrease() {
        XCTAssertEqual(0, try demoViewModel.count.value())
        
        demoViewModel.increase(number: 1)
        XCTAssertEqual(1, try demoViewModel.count.value())
        
        demoViewModel.increase(number: 2)
        XCTAssertEqual(3, try demoViewModel.count.value())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
