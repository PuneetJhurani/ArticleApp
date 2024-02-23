//
//  NewYorkTimesArticleAppUITests.swift
//  NewYorkTimesArticleAppUITests
//
//  Created by Nagarro on 19/02/24.
//

import XCTest

final class ArticleAppUITests: XCTestCase {

    var app : XCUIApplication!
    
    
    override func setUp() {
        app = XCUIApplication()
        app!.launchArguments =  ["enable-testing"]
        app!.launch()
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHeading() {
        
        let headingLabel = app.staticTexts["Heading"]
        XCTAssertEqual(headingLabel.label , "NY Times Most Popular")
    }

    func testArticleListOnScreen() {
        
        let articleList =  app.collectionViews["ArticleList"]
        XCTAssertTrue(articleList.waitForExistence(timeout: 8.0), "Article List not found")
    }
}
