//
//  NumberPad.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct NumberPadView: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
        
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "7")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "8")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "9")
                
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "4")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "5")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "6")
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "1")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "2")
                ButtonNumber(symbol: $symbol,
                             currentNumber: $currentNumber,
                             digit: "3")
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonLargeNumber(symbol: $symbol,
                                  currentNumber: $currentNumber,
                                  digit: "0")
                ButtonComma(symbol: $symbol)
            }
        }
    }
}

struct ButtonComma: View {
    private let digit = ","
    @Binding var symbol: String
    
    var body: some View {
        Button(action: { self.symbol += self.digit
        }){
            ButtonNumberStyle(digit: digit)
        }
    }
}

struct ButtonNumber: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var digit: String
    
    var body: some View {
        Button(action: {
            self.symbol += self.digit
            self.currentNumber.append(contentsOf: self.digit)
        }){
            ButtonNumberStyle(digit: digit)
        }
    }
}

struct ButtonLargeNumber: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var digit: String
    
    var body: some View {
        Button(action: {
            self.symbol += self.digit
            self.currentNumber.append(contentsOf: self.digit)
        }){
            ButtonNumberLargeStyle(digit: digit)
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
        NumberPadView(symbol: .constant("0123456789"),
                      currentNumber: .constant("123"))
    }
}
#endif
