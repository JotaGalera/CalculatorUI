//
//  NumberPad.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct NumberPadView: View {
    var calculatorViewModel: CalculatorViewModel
        
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "7")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "8")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "9")
                
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "4")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "5")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "6")
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "1")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "2")
                ButtonNumber(calculatorViewModel: calculatorViewModel,
                             digit: "3")
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonLargeNumber(calculatorViewModel: calculatorViewModel,
                                  digit: "0")
                ButtonComma(calculatorViewModel: calculatorViewModel,
                            digit: ",")
            }
        }
    }
}

struct ButtonNumber: View {
    var calculatorViewModel: CalculatorViewModel
    
    var digit: String
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.addToOperationsDisplayed(digits: self.digit)
            self.calculatorViewModel.addCurrentNumber(digit: self.digit)
        }){
            ButtonNumberStyle(digit: digit)
        }
    }
}

struct ButtonLargeNumber: View {
    var calculatorViewModel: CalculatorViewModel
    
    var digit: String
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.addToOperationsDisplayed(digits: self.digit)
            self.calculatorViewModel.addCurrentNumber(digit: self.digit)
        }){
            ButtonNumberLargeStyle(digit: digit)
        }
    }
}

struct ButtonComma: View {
    var calculatorViewModel: CalculatorViewModel
    
    var digit: String
    
    var body: some View {
        Button(action: {
            self.calculatorViewModel.addToOperationsDisplayed(digits: self.digit)
            self.calculatorViewModel.addCurrentNumber(digit: ".")
            //TODO: Add to currentNumber
        }){
            ButtonNumberStyle(digit: digit)
        }
    }
}

struct ButtonNumberLargeStyle: View {
    var digit: String
    
    var body: some View {
        Text(digit)
            .padding(.leading, 30)
            .frame(width: 150, height: 70, alignment: .leading)
            .foregroundColor(.white)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color(red: 51/255, green:51/255, blue: 51/255))
            .cornerRadius(80)
    
    }
}

struct ButtonNumberStyle: View {
    var digit: String
    
    var body: some View {
        Text(digit)
            .frame(width: 70, height: 70)
            .foregroundColor(.white)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color(red: 51/255, green:51/255, blue: 51/255))
            .cornerRadius(80)
    }
}

#if DEBUG
struct NumberPadView_Previews: PreviewProvider {
    
    static var previews: some View {
        NumberPadView(calculatorViewModel: CalculatorViewModel())
    }
}
#endif
