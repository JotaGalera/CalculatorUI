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
    private var signs: [String]? = []
    private var result: Double? = 0
    private var calculateOperationUseCase = CalculateOperationUseCase()
    
    // MARK: View Function
    
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
        numbers?.append( Utils().convertStringToDouble(currentNumber) )
    }
    
    func cleanCurrentNumber() {
        currentNumber = ""
    }
    
    func addToOperands(operarand: String) {
        signs?.append(operarand)
    }
    
    // MARK: Buttons Functionality - Calculate result -
    
    func getResult() {
        self.calculateResult()
        self.setUpDisplayedResult()
    }
    
    private func calculateResult(){
        calculateMajorPriorityOperations()
        calculateMinorPriorityOperation()
    }
    
    private func calculateMajorPriorityOperations() {
        var arrayNumbersIndexRemoved: [Int] = []
        
        guard let count = signs?.count, count > 1 else { return }
        
        for index in 0...count-1 {
            guard let sign = signs?[index], let firstNumber = numbers?[index], let secondNumber = numbers?[index+1] else { return }
            
            if sign == Operations.mult.rawValue || sign == Operations.div.rawValue {
                numbers?[index+1] = calculateOperationUseCase.decideOperation(sign: sign, firstNumber: firstNumber, secondNumber: secondNumber)
                arrayNumbersIndexRemoved.append(index)
            }
        }
        
        for index in arrayNumbersIndexRemoved.reversed() {
            numbers?.remove(at: index)
        }
        signs?.removeAll(where: { $0 == "x" || $0 == "/"} )
    }
    
    private func calculateMinorPriorityOperation() {
        result = numbers![0]
        guard let count = signs?.count, count > 0 else { return }
        
        for index in 0...count-1 {
            guard let sign = signs?[index], let res = result, let number = numbers?[index+1] else { return }
            result = calculateOperationUseCase.decideOperation(sign: sign, firstNumber: res, secondNumber: number)
            removeOperandUsed()
        }
    }
        
    private func removeOperandUsed(){
        signs?.removeFirst()
    }
    
    private func setUpDisplayedResult() {
        guard let resultDisplayed = result else {
            setOperationDisplayed(digits: "0")
            return
        }
        preparingNextOperation(firtOperand: resultDisplayed)
        preparingResultToBeDisplayed(resultDisplayed: resultDisplayed)
    }
    
    private func setOperationDisplayed(digits: String){
        operationsDisplayed? = digits
    }
    
    private func preparingNextOperation(firtOperand: Double) {
        setCurrentNumber(digit: "\(firtOperand)")
        resetValues()
    }
    
    private func setCurrentNumber(digit: String){
        self.currentNumber = digit
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
        let resultDouble = Utils().convertStringToDouble(result)
        
        let hasDecimalNumbers = resultDouble.truncatingRemainder(dividingBy: 1) != 0
        guard hasDecimalNumbers else {
            return "\(Int(resultDouble))"
        }
        let resultFormatted = result.replacingOccurrences(of: ".", with: ",")
        
        return resultFormatted
    }
    
    // MARK: - AllClear -
    
    func allClear() {
        operationsDisplayed = ""
        currentNumber = ""
        numbers?.removeAll()
        signs?.removeAll()
        result = 0
    }
    
    // MARK: - Change Sign -
    
    func changeSign() {
        guard let currentNumber = currentNumber else { return }
        let number = Utils().convertStringToDouble(currentNumber)
        if number != 0 {
            let numberSignedChanged = "\(number * -1)"
            self.currentNumber = numberSignedChanged
            self.operationsDisplayed = numberSignedChanged
        }
    }

    // MARK: - Percentage -
    
    func calculatePercentage() {
        guard let currentNumber = currentNumber else { return }
        let number = Utils().convertStringToDouble(currentNumber)
        guard number != 0 else { return }
        let percentage = number / 100
        let percentageDisplayed = formatResult(result: "\(percentage)")
        
        updateOperationDisplayedWithPercentage(previousCharacters: currentNumber, with: percentageDisplayed)
        
        setCurrentNumber(digit: "\(percentage)")
    }
    
    private func updateOperationDisplayedWithPercentage(previousCharacters: String, with percentageDisplayed: String) {
        guard let operationsDisplayed = operationsDisplayed else { return }
        
        let operationDisplayedRefreshed = replacingLastMatch(of: operationsDisplayed, previousCharacters: previousCharacters, with: percentageDisplayed)
        
        setOperationDisplayed(digits: operationDisplayedRefreshed)
    }
    
    private func replacingLastMatch(of mainString: String, previousCharacters: String, with model: String) -> String {
        let lastPosition = mainString.count - previousCharacters.count
        let start = mainString.index(mainString.startIndex, offsetBy: lastPosition);
        let end = mainString.index(mainString.startIndex, offsetBy: lastPosition + previousCharacters.count);
        
        return mainString.replacingCharacters(in: start..<end, with: model)
    }
}


