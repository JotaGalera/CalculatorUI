//
//  ContentView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 21/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        Color.black
            .overlay(
                CalculatorMainScreen()
                ).edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorMainScreen: View {
    @State var operation: String = ""
    
    var body: some View {
        VStack(){
            DisplayOperationView(operation: $operation)
                .padding()
            KeypadView(symbol: $operation)
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
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            SpecialPadView(symbol: $symbol)
            HStack{
                NumberPadView(symbol: $symbol)
                OperandPadView(symbol: $symbol)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
