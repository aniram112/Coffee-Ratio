//
//  MainScreen.swift
//  RatiosUITests
//
//  Created by Marina Roshchupkina on 21.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import Foundation
import XCTest

protocol Screen {
    var app: XCUIApplication { get }
}

struct MainScreen : Screen{
    var app: XCUIApplication
    
    private enum Identifiers {
        static let coffee = "coffeeTextField"
        static let water = "waterTextField"
        static let waterAmount = "waterAmountText"
        static let timer = "timerText"
        static let start = "Start"
        static let pause = "Pause"
        static let reset = "Reset"
    }
    
    func typeCoffee(_ coffeeGrams: String) -> Self {
        let coffee = app.textFields[Identifiers.coffee]
        coffee.tap()
        coffee.clear()
        coffee.typeText("\(coffeeGrams)\n")
        return self
    }
    
    func typeWater(_ waterRatio: String) -> Self {
        let water = app.textFields[Identifiers.water]
        water.tap()
        water.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        app.keys["delete"].tap()
        water.typeText("\(waterRatio)\n")
        return self
    }
    
    func getWaterAmount() -> String {
        let waterAmount = app.staticTexts[Identifiers.waterAmount].label
        return waterAmount
    }
    
    func getTimerValue() -> String {
        let timerValue = app.staticTexts[Identifiers.timer].label
        return timerValue
    }
    
    func startTimer() -> Self{
        let start = app.buttons[Identifiers.start]
        start.tap()
        return self
    }
    
    func pauseTimer() -> Self{
        let pause = app.buttons[Identifiers.pause]
        pause.tap()
        return self
    }
    
    func resetTimer() -> Self{
        let reset = app.buttons[Identifiers.reset]
        reset.tap()
        return self
    }
    
}


// способ со стака который не работает с маленькими числами
// вообще с удалением большие проблемы и хотелось бы узнать как правильно
extension XCUIElement {
    public func clear() {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
        lowerRightCorner.tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
    }
}

