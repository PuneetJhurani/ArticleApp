//
//  RepositoryTestCases.swift
//  ArchitectureBiolerplateTests
//
//  Created by Puneet jhurani  on 25/09/23.
//

import XCTest
@testable import NewYorkTimesArticleApp

class RepositoryTestCases: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGetEntityWithSuccess() throws{

        let apiManager = MockApiManager()
        let repository = ArticleRepository(apiManager: apiManager)
        
        repository.getEntity { resource in
            XCTAssertEqual(resource.data?[0].title, "AnyTitle")
        }
    }
    
    func testGetEntityWithFailure() throws{

        let apiManager = MockApiManager()
        let repository = ArticleRepository(apiManager: apiManager)
        
        repository.getEntity { resource in
            XCTAssertEqual(resource.errorCode, 100)
        }
    }

}
