//
//  ContentView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 21/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Color.black
            .overlay(
                CalculatorMainScreen(calculatorViewModel: calculatorViewModel)
                ).edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorMainScreen: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        VStack(){
            DisplayOperationView(calculatorViewModel: calculatorViewModel)
                .padding()
            KeypadView(calculatorViewModel: calculatorViewModel)
        }
    }
}

struct DisplayOperationView: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        Text(calculatorViewModel.getOperationsDisplayed())
        .padding()
        .font(Font.custom("Montserrat-Bold", size: 50.0))
        .foregroundColor(Color.white)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 300, alignment: Alignment.bottomTrailing)
    }
}

struct KeypadView: View {
    var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            SpecialPadView(calculatorViewModel: calculatorViewModel)
            HStack{
                NumberPadView(calculatorViewModel: calculatorViewModel)
                OperandPadView(calculatorViewModel: calculatorViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(calculatorViewModel: CalculatorViewModel())
    }
}
