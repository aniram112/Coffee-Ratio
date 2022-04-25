//
//  TimerTests.swift
//  RatiosUITests
//
//  Created by Marina Roshchupkina on 21.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import Foundation
import XCTest

final class TimerTests: BaseUITest {
    func testStart() {
        let screen = MainScreen(app: app)
            .startTimer()
        sleep(1)
        XCTAssertEqual(screen.getTimerValue(),"00:01")
    }
    
    func testPause() {
        var screen = MainScreen(app: app)
            .startTimer()
        sleep(1)
        screen = screen.pauseTimer() // screen = только чтобы убрать ворнинги
        sleep(1)
        XCTAssertEqual(screen.getTimerValue(),"00:01")
    }
    
    func testPauseContinue() {
        var screen = MainScreen(app: app)
            .startTimer()
        sleep(1)
        screen = screen.pauseTimer()
        sleep(1)
        screen = screen.startTimer()
        sleep(1)
        XCTAssertEqual(screen.getTimerValue(),"00:02")
    }
    
    func testReset() {
        var screen = MainScreen(app: app)
            .startTimer()
        sleep(1)
        screen = screen.resetTimer()
        XCTAssertEqual(screen.getTimerValue(),"00:00")
    }
    
    func testResetWithPause() {
        var screen = MainScreen(app: app)
            .startTimer()
        sleep(1)
        screen = screen.pauseTimer()
        screen = screen.resetTimer()
        XCTAssertEqual(screen.getTimerValue(),"00:00")
    }
}
