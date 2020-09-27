//
//  SpecialPad.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 27/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct SpecialPadView: View {
    @Binding var symbol: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10.0){
            ButtonAllClear(symbol: $symbol)
            ButtonChangeSign()
            ButtonPercentage()
            ButtonDivideOperation(symbol: $symbol)
        }
    }
}

struct ButtonAllClear: View {
    @Binding var symbol: String
    
    var body: some View {
        Button(action: { self.symbol = "" }){
            ButtonSpecialPadStyle(operation: "AC", colorText: Color.black)
        }
    }
}

struct ButtonChangeSign: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonSpecialPadStyle(operation: "+/-", colorText: Color.black)
        }
    }
}

struct ButtonPercentage: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonSpecialPadStyle(operation: "%", colorText: Color.black)
        }
    }
}

struct ButtonDivideOperation: View {
    private let digit = "÷"
    private let displayedDigit = "/"
    @Binding var symbol: String
    
    var body: some View {
        Button(action: { self.symbol += self.displayedDigit}){
            ButtonBasicOperationStyle(operation: digit, colorText: Color.white)
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
        SpecialPadView(symbol: .constant(""))
    }
}
#endif
