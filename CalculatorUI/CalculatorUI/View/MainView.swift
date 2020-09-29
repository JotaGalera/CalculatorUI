//
//  ContentView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 21/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Color.black
            .overlay(
                CalculatorMainScreen(calculatorViewModel: calculatorViewModel)
                ).edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorMainScreen: View {
    @State var operation: String = ""
    @State var currentNumber: String = ""
    
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        VStack(){
            DisplayOperationView(operation: $operation)
                .padding()
            KeypadView(symbol: $operation,
                       currentNumber: $currentNumber,
                       calculatorViewModel: calculatorViewModel)
        }
    }
}

struct DisplayOperationView: View {
    @Binding var operation: String
    
    var body: some View {
        Text(operation)
        .padding()
        .font(Font.custom("Montserrat-Bold", size: 50.0))
        .foregroundColor(Color.white)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 300, alignment: Alignment.bottomTrailing)
    }
}

struct KeypadView: View {
    @Binding var symbol: String
    @Binding var currentNumber: String
    
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            SpecialPadView(symbol: $symbol)
            HStack{
                NumberPadView(symbol: $symbol,
                              currentNumber: $currentNumber)
                OperandPadView(symbol: $symbol,
                               currentNumber: $currentNumber,
                               calculatorViewModel: calculatorViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(calculatorViewModel: CalculatorViewModel())
    }
}
