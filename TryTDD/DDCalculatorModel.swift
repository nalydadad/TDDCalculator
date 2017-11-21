//
//  DDCalculatorModel.swift
//  TryTDD
//
//  Created by  Dada on 2017/11/15.
//  Copyright © 2017年  Dada. All rights reserved.
//

import UIKit


enum CalculatorError: Error {
    case unSupportedOperator
    case typeCastError
}


class DDCalculatorModel: NSObject {
	static public let supportedOperator = ["+", "-", "*", "/"]
    private var leftValue = ""
    private var rightValue = ""
	private var lastOperator = ""
    
    public var currentOutput = "0"
	
    private func reset() {
        self.leftValue = ""
        self.rightValue = ""
        self.lastOperator = ""
        self.currentOutput = "0"
    }
    
	public func input(key: String) {
        // 輸入 數字
        if let _ = Int(key) {
            if self.lastOperator.isEmpty {
                self.leftValue = appendNumberToString(str: self.leftValue, number: key)
                self.currentOutput = self.leftValue
            }
            else {
                self.rightValue = appendNumberToString(str: self.rightValue, number: key)
                self.currentOutput = self.rightValue
            }
        }
        // 輸入 .
        else if key == "." {
            if self.lastOperator.isEmpty {
                self.leftValue = appendDotToString(self.leftValue)
                self.currentOutput = self.leftValue
            }
            else {
                self.rightValue = appendDotToString(self.rightValue)
                self.currentOutput = self.rightValue
            }
        }
        // 輸入 等於
        else if key == "=" {
            if self.lastOperator.isEmpty {
                do {
                    let newValue = try stringToDoubleValue(self.leftValue)
                    self.currentOutput = doubleValueToString(newValue)
                }
                catch {
                    NSLog(error.localizedDescription)
                }
            }
            else {
                calculate()
                self.lastOperator = ""
            }
        }
        // 輸入 operator
        else if DDCalculatorModel.supportedOperator.contains(key) {
            if leftValue.isEmpty { return }
            calculate()
            self.lastOperator = key
		}
	}
    
    private func calculate() {
        if self.lastOperator.isEmpty || self.leftValue.isEmpty || self.rightValue.isEmpty {
            return
        }
        
        var leftValue: Double!
        var rightValue: Double!
        do {
            leftValue = try stringToDoubleValue(self.leftValue)
            rightValue = try stringToDoubleValue(self.rightValue)
        }
        catch {
            NSLog(error.localizedDescription)
        }
    
		switch self.lastOperator {
		case "+":
            let result = leftValue + rightValue
			self.leftValue = doubleValueToString(result)
            self.currentOutput = self.leftValue
		case "-":
            let result = leftValue - rightValue
			self.leftValue = doubleValueToString(result)
            self.currentOutput = self.leftValue
		case "*":
            let result = leftValue * rightValue
			self.leftValue = doubleValueToString(result)
            self.currentOutput = self.leftValue
		case "/":
            let result = (rightValue == 0) ? 0.0 : leftValue / rightValue
            self.leftValue = doubleValueToString(result)
            self.currentOutput = self.leftValue
		default:
            return
		}
        
        self.rightValue = ""
	}
    
    private func doubleValueToString(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            // Ignore redundant zero
            return String(Int(value))
        }
        return String(value)
    }
    
    private func stringToDoubleValue(_ str: String) throws -> Double {
        if str.isEmpty {
            throw CalculatorError.typeCastError
        }
        
        if str.last == "." {
            var newStr = str
            newStr.removeLast()
            if let doubleValue = Double(newStr) {
                return doubleValue
            }
            else {
                throw CalculatorError.typeCastError
            }
        }
        
        
        if let doubleValue = Double(str) {
            return doubleValue
        }
        else {
            throw CalculatorError.typeCastError
        }
    }
    
    
    private func appendDotToString(_ str: String) -> String {
        if str.contains(".") {
            return str
        }
        return str + "."
    }
    
    private func appendNumberToString(str: String, number: String) -> String {
        if str == "0" || str == "" {
            return number
        }
        return str + number
    }
}
