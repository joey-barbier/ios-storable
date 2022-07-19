//
//  ios_storable_demoTests.swift
//  ios-storable-demoTests
//
//  Created by Joey BARBIER on 27/06/2022.
//

import XCTest
@testable import ios_storable_demo

class ios_storable_demoTests: XCTestCase {

    private var tag = "test"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() throws {
        let item: Todo = try! Todo.previewData()
        try item.storage.add(withTag: tag)
    }

    func testRestoreItem() throws {
        let item: Todo = try! Todo.previewData()
        if Todo.restore.find(byId: "\(item.id)", tag: tag) == nil {
            XCTFail("item not found (find by id + flag)")
        }
    }
    
    func testRestoreItems() throws {
        let item: Todo = try! Todo.previewData()
        let listBdd = Todo.restore.find(byTag: tag)
        if !listBdd.contains(item) {
            XCTFail("item not found (find by tag)")
        }
    }
    
    func testRestoreFakeItem() throws {
        let item: Todo = try! Todo.previewData()
        let listBdd = Todo.restore.find(byTag: "\(tag)_fake")
        if listBdd.contains(item) {
            XCTFail("item found in fake flag")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
