//
//  RatiosUITests.swift
//  RatiosUITests
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import XCTest

class BaseUITest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
        
        
    }
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        app.terminate()
    }
    
    
    // Использовался для записи и получения всех элементов
    /*func testGetAll(){
        let app = XCUIApplication()
        app.textFields["coffeeTextField"].tap()
        app.staticTexts["waterAmountText"].tap()
        app.staticTexts["timerText"].tap()
        app.buttons["Start"].tap()
        app.buttons["Pause"].tap()
        app.buttons["Reset"].tap()
        app.textFields["waterTextField"].tap()
                        
    }*/
    

    /*func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }*/
}
