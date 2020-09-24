//
//  ContentView.swift
//  CalculatorUI
//
//  Created by Javier Galera Garrido on 21/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Color.black
            .overlay(
                CalculatorMainScreen()
                ).edgesIgnoringSafeArea(.all)
    }
}

struct CalculatorMainScreen: View {
    @State var operation: String = "1 + 2 = 3"
    
    var body: some View {
        VStack{
            DisplayOperationView(operation: $operation)
            KeypadView()
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
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 400, alignment: Alignment.bottomTrailing)
    }
}

struct KeypadView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            SpecialPad()
            HStack{
                NumberPad()
                OperandPad()
            }
        }
    }
}

struct NumberPad: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10.0){
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumberSeven()
                ButtonNumberEight()
                ButtonNumberNine()
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumberFour()
                ButtonNumberFive()
                ButtonNumberSix()
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumberOne()
                ButtonNumberTwo()
                ButtonNumberThree()
            }
            HStack(alignment: .center, spacing: 10.0){
                ButtonNumberZero()
                ButtonComma()
            }
        }
    }
}

struct OperandPad: View {
    var body: some View{
        VStack(alignment: .center, spacing: 10.0){
            ButtonMultiplyOperation()
            ButtonSubstractOperation()
            ButtonPlusOperation()
            ButtonEqualOperation()
        }
    }
}

struct SpecialPad: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10.0){
            ButtonAllClear()
            ButtonChangeSign()
            ButtonPercentage()
            ButtonDivideOperation()
        }
    }
}

struct ButtonNumberZero: View {
    var body: some View {
        Button(action: { print("tap zero number button")
        }){
            ButtonNumberLargeStyle(digit: "0")
        }
    }
}

struct ButtonComma: View {
    var body: some View {
        Button(action: { print("tap comma button")
        }){
            ButtonNumberStyle(digit: ",")
        }
    }
}

struct ButtonNumberOne: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "1")
        }
    }
}

struct ButtonNumberTwo: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "2")
        }
    }
}

struct ButtonNumberThree: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "3")
        }
    }
}

struct ButtonNumberFour: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "4")
        }
    }
}

struct ButtonNumberFive: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "5")
        }
    }
}

struct ButtonNumberSix: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "6")
        }
    }
}

struct ButtonNumberSeven: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "7")
        }
    }
}

struct ButtonNumberEight: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "8")
        }
    }
}

struct ButtonNumberNine: View {
    var body: some View {
        Button(action: { print("tap one number button")
        }){
            ButtonNumberStyle(digit: "9")
        }
    }
}

struct ButtonEqualOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "=", colorText: Color.white)
        }
    }
}

struct ButtonPlusOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "+", colorText: Color.white)
        }
    }
}

struct ButtonSubstractOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "-", colorText: Color.white)
        }
    }
}

struct ButtonMultiplyOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "x", colorText: Color.white)
        }
    }
}

struct ButtonDivideOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "÷", colorText: Color.white)
        }
    }
}

struct ButtonAllClear: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
