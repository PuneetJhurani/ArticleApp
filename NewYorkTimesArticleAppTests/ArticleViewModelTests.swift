//
//User Detail View Model Tests 
//
//
//  Created by Puneet jhurani  on 03/07/23.

import XCTest
import Combine
import Swinject
@testable import NewYorkTimesArticleApp
import SwiftUI

class ArticleViewModelTests: XCTestCase {
    
    
   var articleViewModel: ArticleViewModel?
    
   override  func setUp() {

       articleViewModel = ArticleViewModel(
            repository: MockRepository(),
            analyticsHelper: AnalyticsHelper.getInstance()
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() throws {

        let locaPreferencesTest = LocalPreferences.getInstance()
        XCTAssertNotNil(locaPreferencesTest)
    }


    func testEncryptionHelper() throws {
        XCTAssertNotNil(EncryptionHelper.getInstance())
    }

    func testViewModelSuccess() {

        let expectation = XCTestExpectation(
            description: "Fetch data"
        )

        articleViewModel?.fetchArticleList()
        DispatchQueue.main.async { [weak self] in
            XCTAssertEqual(self?.articleViewModel?.articles[0].title,"AnyTitle")
                  expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)

    }
    
    func testViewModelFailure() {
        let expectation = XCTestExpectation(
            description: "Fetch data failure"
        )

        articleViewModel?.fetchArticleList()

        DispatchQueue.main.async { [weak self] in
            XCTAssertEqual(self?.articleViewModel?.articles.count, 0)
                  expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

