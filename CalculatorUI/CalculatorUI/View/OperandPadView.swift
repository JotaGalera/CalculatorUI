//
//  OperandPadView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct OperandPadView: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View{
        VStack(alignment: .center, spacing: 10.0){
            ButtonOperand(symbol: $symbol,
                          currentNumber: $currentNumber,
                          digit: "x",
                          calculatorViewModel: calculatorViewModel)
            ButtonOperand(symbol: $symbol,
                          currentNumber: $currentNumber,
                          digit: "-",
                          calculatorViewModel: calculatorViewModel)
            ButtonOperand(symbol: $symbol,
                          currentNumber: $currentNumber,
                          digit: "+",
                          calculatorViewModel: calculatorViewModel)
            ButtonEqualOperation(symbol: $symbol,
                                 currentNumber: $currentNumber,
                                 calculatorViewModel: calculatorViewModel)
        }
    }
}

struct ButtonOperand: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var digit: String
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.addToNumber(operation: self.currentNumber)
            self.symbol += self.digit
            self.calculatorViewModel.addToOperand(operation: self.digit)
            self.currentNumber = ""
        }){
            ButtonBasicOperationStyle(operation: digit, colorText: Color.white)
        }
    }
}
struct ButtonEqualOperation: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.addToNumber(operation: self.currentNumber)
            self.currentNumber = "0"
            self.symbol = self.calculatorViewModel.getResult()
            
        }){
            ButtonBasicOperationStyle(operation: "=", colorText: Color.white)
        }
    }
}

struct ButtonBasicOperationStyle: View {
    var operation: String
    var colorText: Color
    
    var body: some View {
        Text(operation)
            .frame(width: 70, height: 70)
            .foregroundColor(colorText)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color.orange)
            .cornerRadius(80)
    }
}

#if DEBUG
struct OperandPadView_Previews: PreviewProvider {
    static var previews: some View {
        OperandPadView(symbol: .constant("+-x"),
                       currentNumber: .constant("123"),
                       calculatorViewModel: CalculatorViewModel())
    }
}
#endif
