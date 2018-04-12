//
//  CalculatorModelTests.swift
//  TryTDDTests
//
//  Created by  Dada on 2017/11/15.
//  Copyright © 2017年  Dada. All rights reserved.
//

import XCTest

@testable import TryTDD

class CalculatorModelTests: XCTestCase {
     
	func testInputANumber() {
		// Arrange
		let calculator = DDCalculatorModel()
		
		// Act
		calculator.input(key: "5")
		
		// Assert
		XCTAssertTrue(calculator.currentOutput == "1")
	}
	
	func testInputIsAnOperatorInTheBeginning() {
		// Arrange
		let calculator = DDCalculatorModel()
		
		// Act
		let inputValue = "+"
		calculator.input(key: inputValue)
		
		// Assert
		XCTAssertTrue(calculator.currentOutput == "0")
	}
	
	
	func testPlusFunction() {
		let calculator = DDCalculatorModel()

        calculator.input(key: "1")
        XCTAssertTrue(calculator.currentOutput == "1")
        calculator.input(key: "+")
        XCTAssertTrue(calculator.currentOutput == "1")
        calculator.input(key: "3")
        XCTAssertTrue(calculator.currentOutput == "3")
        calculator.input(key: "=")
        XCTAssertTrue(calculator.currentOutput == "4")
	}
    
    func testMinusFunction() {
        let calculator = DDCalculatorModel()
        
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "-")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "3")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "-1", calculator.currentOutput)
    }
    
    func testCrossFunction() {
        let calculator = DDCalculatorModel()
        
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "*")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
    }
    
    func testDivideFunction() {
        let calculator = DDCalculatorModel()
        
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "/")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0.5", calculator.currentOutput)
    }
	
    func testDevideByZero() {
        // Arrange
        let calculator = DDCalculatorModel()
        
        // Act
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "/")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
    }
    
    func testRepeatlyInsertTheSameNumber() {
        let calculator = DDCalculatorModel()
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        
        
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "11", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "111", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1111", calculator.currentOutput)
    }
    
    func testSequenceWithDot() {
        //0.0.0.0.0.0.01
        
        let calculator = DDCalculatorModel()
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.00", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "0.001", calculator.currentOutput)
    }
    
    func testLeftStringWithDotAndEqual() {
        
        // 0 . = . 0 . 0 0 1 =
        let calculator = DDCalculatorModel()
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.00", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.000", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "0.0001", calculator.currentOutput)
    }
    
    func testLeftStringWithDot() {
        
        // 0 . . . . 0 0 1 = 0.001
        let calculator = DDCalculatorModel()
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "0.", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.0", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "0.00", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "0.001", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0.001", calculator.currentOutput)
        
    }
    
    func testRightStringWithDot() {
        // 8 + 3 . 2 =
        let calculator = DDCalculatorModel()
        calculator.input(key: "8")
        XCTAssert(calculator.currentOutput == "8", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "8", calculator.currentOutput)
        calculator.input(key: "3")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "3.", calculator.currentOutput)
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "3.2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "11.2", calculator.currentOutput)
    }
    
    
    func testComboCalculate() {
        // + 1 + +
        let calculator = DDCalculatorModel()
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
    }
    
    
    func testComboEqual() {
        // + 1 = = = =
        let calculator = DDCalculatorModel()
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
    }
    
    func testChangeOperator() {
        // 5 + - 2 = =
        let calculator = DDCalculatorModel()
        calculator.input(key: "5")
        XCTAssert(calculator.currentOutput == "5", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "5", calculator.currentOutput)
        calculator.input(key: "-")
        XCTAssert(calculator.currentOutput == "5", calculator.currentOutput)
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        
    }
    
    
    func testComboSubtractingWithEqual() {
        // 1 + 3 - 2 = = =
        let calculator = DDCalculatorModel()
        calculator.input(key: "1")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "1", calculator.currentOutput)
        calculator.input(key: "3")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        calculator.input(key: "-")
        XCTAssert(calculator.currentOutput == "4", calculator.currentOutput)
        calculator.input(key: "2")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "2", calculator.currentOutput)
    }
    
    func testNoneRightString() {
        // + = - = - =
        let calculator = DDCalculatorModel()
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "-")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "-")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "0", calculator.currentOutput)
    }
    
    func testLastOperationWasEqual2() {
        // 5 + 3 = 0 . 3 =
        let calculator = DDCalculatorModel()
        calculator.input(key: "5")
        XCTAssert(calculator.currentOutput == "5", calculator.currentOutput)
        calculator.input(key: "+")
        XCTAssert(calculator.currentOutput == "5", calculator.currentOutput)
        calculator.input(key: "3")
        XCTAssert(calculator.currentOutput == "3", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "8", calculator.currentOutput)
        calculator.input(key: "0")
        XCTAssert(calculator.currentOutput == "80", calculator.currentOutput)
        calculator.input(key: ".")
        XCTAssert(calculator.currentOutput == "80.", calculator.currentOutput)
        calculator.input(key: "3")
        XCTAssert(calculator.currentOutput == "80.3", calculator.currentOutput)
        calculator.input(key: "=")
        XCTAssert(calculator.currentOutput == "80.3", calculator.currentOutput)
    }
}
