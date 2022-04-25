//
//  RatioTests.swift
//  RatiosUITests
//
//  Created by Marina Roshchupkina on 21.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import Foundation
import XCTest

final class RatioTests: BaseUITest {
    func testRatioSimple() {
        let screen = MainScreen(app: app)
            .typeCoffee("100")
            .typeWater("2")
        XCTAssertEqual(screen.getWaterAmount(),"200.0")
    }
    
    func testRatioReverse() {
        let screen = MainScreen(app: app)
            .typeWater("2")
            .typeCoffee("100")
        XCTAssertEqual(screen.getWaterAmount(),"200.0")
    }
    
    func testRatioDoubleInputCoffee() {
        let screen = MainScreen(app: app)
            .typeCoffee("100")
            .typeWater("2")
            .typeCoffee("200")
        XCTAssertEqual(screen.getWaterAmount(),"400.0")
    }
    
    func testRatioDoubleInputWater() {
        let screen = MainScreen(app: app)
            .typeWater("2")
            .typeCoffee("100")
            .typeWater("1")
        XCTAssertEqual(screen.getWaterAmount(),"100.0")
    }
    
    func testRatioFractionWater() {
        let screen = MainScreen(app: app)
            .typeCoffee("100")
            .typeWater("2.5")
        XCTAssertEqual(screen.getWaterAmount(),"250.0")
    }
    
    func testRatioFractionCoffee() {
        let screen = MainScreen(app: app)
            .typeCoffee("100.5")
            .typeWater("2")
        XCTAssertEqual(screen.getWaterAmount(),"201.0")
    }
    
    func testRatioFractionSmall() {
        let screen = MainScreen(app: app)
            .typeCoffee("0.5")
            .typeWater("0.5")
        XCTAssertEqual(screen.getWaterAmount(),"0.25")
    }
    
    func testRatioGibberish() {
        let screen = MainScreen(app: app)
            .typeCoffee("abcbabds")
            .typeWater("ajjcsn")
        XCTAssertEqual(screen.getWaterAmount(),"0.0")
    }
    
    func testRatioNegative() {
        let screen = MainScreen(app: app)
            .typeCoffee("-100")
            .typeWater("2")
        XCTAssertEqual(screen.getWaterAmount(),"-200.0")
    }
    
    func testRatioRandom() {
        var screen = MainScreen(app: app)
        for _ in 1...10{
            let cmd = Int.random(in: 0...1)
            if (cmd == 0){
                screen = screen.typeCoffee(String(Int.random(in: 100...500)))
            } else{
                screen = screen.typeWater(String(Int.random(in: 1...10)))
            }
        }
    }
    
}

