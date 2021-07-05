//
//  TestNisumTests.swift
//  TestNisumTests
//
//  Created by Uriel Martinez on 02/07/2021.
//

import XCTest
@testable import TestNisum

class TestNisumTests: XCTestCase {

    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func viewDidload(searchText: String) {
        self.interactor?.fetchDefinition(forAcromine: "CTO") {(response) in
            switch response {
            case .success(let acromines):
                guard let resultAcromines = acromines[0], !resultAcromines.lfs.isEmpty else {
                    XCTAssertFalse(false, "Results Empty")
                    return
                }
                XCTAssert(true, "Results success")
            case .failure(let error):
                XCTAssertFalse(false, "Not Results")            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
