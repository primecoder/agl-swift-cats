//
//  SwiftCatsUITests.swift
//  SwiftCatsUITests
//
//  Created by Ace Authors on 25/4/21.

import XCTest

class SwiftCatsUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    func testSwiftCatUI() throws {
        app.launch()

        XCTAssertTrue(app.buttons["README"].exists, "README tab not exist")
        XCTAssertTrue(app.buttons["UIKit Demo"].exists, "UIKit Demo tab not exist")
        XCTAssertTrue(app.buttons["SwiftUI/Combine Demo"].exists, "SwiftUI/Combine Demo tab not exist")
        
        app.buttons["UIKit Demo"].tap()
        XCTAssertTrue(app.staticTexts["Cats owned by: Male"].waitForExistence(timeout: 5), "UI element not found")
        XCTAssertTrue(app.staticTexts["Cats owned by: Female"].waitForExistence(timeout: 5), "UI element not found")

        app.buttons["SwiftUI/Combine Demo"].tap()
        XCTAssertTrue(app.staticTexts["Cats owned by "].waitForExistence(timeout: 5), "UI element not found")
        XCTAssertTrue(app.switches["Human only"].waitForExistence(timeout: 5), "UI element not found")
        
        app.buttons["Remote"].tap()
        XCTAssertTrue(app.staticTexts["Cats owned by "].waitForExistence(timeout: 5), "UI element not found")
        
        app.buttons["Combine"].tap()
        XCTAssertTrue(app.staticTexts["Cats owned by "].waitForExistence(timeout: 5), "UI element not found")
    }

}
