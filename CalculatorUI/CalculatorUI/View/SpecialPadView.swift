//
//  SpecialPad.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct SpecialPadView: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10.0){
            ButtonAllClear(calculatorViewModel: calculatorViewModel)
            ButtonChangeSign(calculatorViewModel: calculatorViewModel)
            ButtonPercentage(calculatorViewModel: calculatorViewModel)
            ButtonDivideOperation(calculatorViewModel: calculatorViewModel)
        }
    }
}

struct ButtonAllClear: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.resetViewModel()
        }){
            ButtonSpecialPadStyle(operation: "AC", colorText: Color.black)
        }
    }
}

struct ButtonChangeSign: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.changeSign()
        }){
            ButtonSpecialPadStyle(operation: "+/-", colorText: Color.black)
        }
    }
}

struct ButtonPercentage: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.calculatePercentage()
        }){
            ButtonSpecialPadStyle(operation: "%", colorText: Color.black)
        }
    }
}

struct ButtonDivideOperation: View {
    var calculatorViewModel: CalculatorViewModel
    private let digitButton = "÷"
    private let digit = "/"

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
            ButtonBasicOperationStyle(operation: digitButton, colorText: Color.white)
        }
    }
}

struct ButtonSpecialPadStyle: View {
    var operation: String
    var colorText: Color
    
    var body: some View {
        Text(operation)
            .frame(width: 70, height: 70)
            .foregroundColor(colorText)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color(red: 165/255, green: 165/255, blue: 165/255))
            .cornerRadius(80)
    }
}

#if DEBUG
struct SpecialPadView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialPadView(calculatorViewModel: CalculatorViewModel())
    }
}
#endif
