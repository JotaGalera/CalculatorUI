//
//  CalculatorViewModel.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 29/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var operationsDisplayed: String? = ""
    private var currentNumber: String? = ""
    private var numbers: [Double]? = []
    private var operands: [String]? = []
    private var result: Double? = 0
    
    // MARK: Displayer
    
    func addToOperationsDisplayed(digits: String) {
        operationsDisplayed? += digits
    }
    
    func setOperationDisplayed(digits: String){
        operationsDisplayed? = digits
    }
    
    func getOperationsDisplayed() -> String {
        guard let operationsDisplayed = operationsDisplayed else { return "" }
        return operationsDisplayed
    }
    
    func addCurrentNumber(digit: String) {
        currentNumber?.append(digit)
    }
    
    func addCurrentNumberToNumber() {
        guard let currentNumber = currentNumber else { return }
        numbers?.append( convertStringToDouble(currentNumber) )
    }
    
    private func convertStringToDouble(_ string: String) -> Double {
        return (string as NSString).doubleValue
    }
    
    func cleanCurrentNumber() {
        currentNumber = ""
    }
    
    func addToOperands(operarand: String) {
        operands?.append(operarand)
    }
    
    // MARK: Buttons
    
    func getResult() -> String {
        self.calculate()
        return "\(result ?? 0)"
    }
    
    private func calculate(){
        guard let number1 = numbers?[0], let number2 = numbers?[1] else {return}
        
        result? += decideOperation(num1: number1, num2: number2)
        
        guard let count = numbers?.count else { return }
        if count > 2{
            for index in 2...count-1 {
                guard let res = result, let number = numbers?[index] else { return }
                result = decideOperation(num1: res, num2: number)
            }
        }
    }
    
    private func decideOperation(num1: Double, num2: Double) -> Double {
        switch operands?[0] {
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
        operands?.removeFirst()
    }
    
    private func add(number1: Double, number2: Double) -> Double{
        return number1 + number2
    }
    
    private func substract(number1: Double, number2: Double) -> Double {
        return number1 - number2
    }
    
    private func multiply(number1: Double, number2: Double) -> Double {
        return number1 * number2
    }
    
    private func divide(number1: Double, number2: Double) -> Double {
        return number1 / number2
    }
    
    func resetViewModel() {
        operationsDisplayed = ""
        currentNumber = ""
        numbers = []
        operands = []
        result = 0
    }
    
    func changeSign() {
        guard let currentNumber = currentNumber else { return }
        let number = convertStringToDouble(currentNumber)
        if number != 0 {
            let numberSignedChanged = "\(number * -1)"
            self.currentNumber = numberSignedChanged
            self.operationsDisplayed = numberSignedChanged
        }
        
    }
    
}


