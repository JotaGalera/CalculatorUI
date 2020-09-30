//
//  CalculatorViewModel.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 29/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    private var operation: String = ""
    private var numbers: [Double] = []
    private var operands: [String] = []
    private var result: Double = 0
    
    func addToNumber(operation: String) {
        numbers.append( convertStringToDouble(operation) )
    }
    
    func addToOperand(operation: String) {
        operands.append(operation)
    }
    
    func getResult() -> String {
        calculate()
        return "\(result)"
    }
    
    private func calculate() {
        
        result += decideOperation(num1: numbers[0], num2: numbers[1])
        if numbers.count > 1{
            for index in 2...numbers.count-1 {
                result = decideOperation(num1: result, num2: numbers[index])
            }
        }
    }
    
    private func decideOperation(num1: Double, num2: Double) -> Double{
        switch operands[0] {
            case "+":
                removeOperandUsed()
                return add(number1: num1, number2: num2)
            case "-":
                removeOperandUsed()
                return substract(number1: num1, number2: num2)
            case "x":
                removeOperandUsed()
                return multiply(number1: num1, number2: num2)
            case "÷":
                removeOperandUsed()
                return divide(number1: num1, number2: num2)
            default:
                return 0
        }
    }
    
    private func removeOperandUsed(){
        operands.removeFirst()
    }
    
    func add(number1: Double, number2: Double) -> Double{
        return number1 + number2
    }
    
    func substract(number1: Double, number2: Double) -> Double {
        return number1 - number2
    }
    
    func multiply(number1: Double, number2: Double) -> Double {
        return number1 * number2
    }
    
    func divide(number1: Double, number2: Double) -> Double {
        return number1 / number2
    }
    
    private func convertStringToDouble(_ string: String) -> Double {
        return (string as NSString).doubleValue
    }
}

