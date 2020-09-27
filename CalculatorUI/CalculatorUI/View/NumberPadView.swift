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
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(digit: "7", symbol: $symbol)
                ButtonNumber(digit: "8", symbol: $symbol)
                ButtonNumber(digit: "9", symbol: $symbol)
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(digit: "4", symbol: $symbol)
                ButtonNumber(digit: "5", symbol: $symbol)
                ButtonNumber(digit: "6", symbol: $symbol)
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumber(digit: "1", symbol: $symbol)
                ButtonNumber(digit: "2", symbol: $symbol)
                ButtonNumber(digit: "3", symbol: $symbol)
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonLargeNumber(digit: "0", symbol: $symbol)
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
    var digit: String
    @Binding var symbol: String
    
    var body: some View {
        Button(action: { self.symbol += self.digit
        }){
            ButtonNumberStyle(digit: digit)
        }
    }
}

struct ButtonLargeNumber: View {
    var digit: String
    @Binding var symbol: String
    
    var body: some View {
        Button(action: { self.symbol += self.digit
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
        NumberPadView(symbol: .constant("0123456789"))
    }
}
#endif
