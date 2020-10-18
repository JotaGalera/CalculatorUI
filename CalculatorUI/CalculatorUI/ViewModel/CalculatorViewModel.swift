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
    
    private func setOperationDisplayed(digits: String){
        operationsDisplayed? = digits
    }
    
    private func setCurrentNumber(digit: String){
        self.currentNumber = digit
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
    
    // MARK: Buttons Functionality
    
    func getResult() {
        self.calculateResult()
        self.setUpDisplayedResult()
    }
    
    private func calculateResult(){
        guard let count = numbers?.count, count > 1 else { return }
        guard let number1 = numbers?[0], let number2 = numbers?[1] else {return}
        
        result? += decideOperation(num1: number1, num2: number2)
        removeOperandUsed()
        
        if count > 2{
            for index in 2...count-1 {
                guard let res = result, let number = numbers?[index] else { return }
                result = decideOperation(num1: res, num2: number)
                removeOperandUsed()
            }
        }
    }
    
    private func decideOperation(num1: Double, num2: Double) -> Double {
        switch operands?[0] {
            case "+":
                return add(number1: num1, number2: num2)
            case "-":
                return substract(number1: num1, number2: num2)
            case "x":
                return multiply(number1: num1, number2: num2)
            case "/":
                return divide(number1: num1, number2: num2)
            default:
                return 0
        }
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
    
    private func removeOperandUsed(){
        operands?.removeFirst()
    }
    
    private func setUpDisplayedResult() {
        guard let resultDisplayed = result else {
            setOperationDisplayed(digits: "0")
            return
        }
        preparingNextOperation(firtOperand: resultDisplayed)
        preparingResultToBeDisplayed(resultDisplayed: resultDisplayed)
    }
    
    private func preparingNextOperation(firtOperand: Double) {
        setCurrentNumber(digit: "\(firtOperand)")
        resetValues()
    }
    
    private func resetValues() {
        numbers?.removeAll()
        result = 0
    }
    
    private func preparingResultToBeDisplayed(resultDisplayed: Double) {
        let resultFormatted = formatResult(result: "\(resultDisplayed)")
        setOperationDisplayed(digits: resultFormatted)
    }
    
    private func formatResult(result: String) -> String{
        let resultDouble = convertStringToDouble(result)
        
        let hasDecimalNumbers = resultDouble.truncatingRemainder(dividingBy: 1) != 0
        guard hasDecimalNumbers else {
            return "\(Int(resultDouble))"
        }
        let resultFormatted = result.replacingOccurrences(of: ".", with: ",")
        return resultFormatted
    }
    
    func allClear() {
        operationsDisplayed = ""
        currentNumber = ""
        numbers?.removeAll()
        operands?.removeAll()
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
    
    func calculatePercentage() {
        guard let currentNumber = currentNumber else { return }
        let number = convertStringToDouble(currentNumber)
        if number != 0 {
            let percentageNumber = "\(number / 100)"
            self.currentNumber = percentageNumber
            self.operationsDisplayed = formatResult(result: percentageNumber)
        }
    }
}


