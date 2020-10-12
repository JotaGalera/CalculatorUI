//
//  OperandPadView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct OperandPadView: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View{
        VStack(alignment: .center, spacing: 10.0){
            ButtonOperand(digit: "x",
                          calculatorViewModel: calculatorViewModel)
            ButtonOperand(digit: "-",
                          calculatorViewModel: calculatorViewModel)
            ButtonOperand(digit: "+",
                          calculatorViewModel: calculatorViewModel)
            ButtonEqualOperation(calculatorViewModel: calculatorViewModel)
        }
    }
}

struct ButtonOperand: View {
    var digit: String
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            //show the operand in the screen
            self.calculatorViewModel.addToOperationsDisplayed(digits: self.digit)
            //Add the last number to numbers array
            self.calculatorViewModel.addCurrentNumberToNumber()
            self.calculatorViewModel.cleanCurrentNumber()
            //Add the last operand to operands array
            self.calculatorViewModel.addToOperands(operarand: self.digit)
        }){
            ButtonBasicOperationStyle(operation: digit, colorText: Color.white)
        }
    }
}
struct ButtonEqualOperation: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            //Add the last number to numbers array
            self.calculatorViewModel.addCurrentNumberToNumber()
            self.calculatorViewModel.cleanCurrentNumber()
            //Calculate the result
            self.calculatorViewModel.getResult()
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
        OperandPadView(calculatorViewModel: CalculatorViewModel())
    }
}
#endif
