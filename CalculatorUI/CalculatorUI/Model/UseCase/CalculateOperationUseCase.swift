//
//  CalculateOperationUseCase.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 26/10/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class CalculateOperationUseCase {
    
    func decideOperation(sign: String, firstNumber: Double, secondNumber: Double) -> Double{
        switch sign {
            case Operations.sum.rawValue:
                return add(firstNumber: firstNumber, secondNumber: secondNumber)
            case Operations.subtraction.rawValue:
                return substract(firstNumber: firstNumber, secondNumber: secondNumber)
            case Operations.mult.rawValue:
                return multiply(firstNumber: firstNumber, secondNumber: secondNumber)
            case Operations.div.rawValue:
                return divide(firstNumber: firstNumber, secondNumber: secondNumber)
            default:
                return 0
        }
    }
    
    private func add(firstNumber: Double, secondNumber: Double) -> Double{
        return firstNumber + secondNumber
    }
    
    private func substract(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    
    private func multiply(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    
    private func divide(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}
