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
        VStack{
            DisplayOperation()
            SpecialPad()
            HStack{
                NumberPad()
                OperandPad()
            }
        }
        
    }
}

struct DisplayOperation: View {
    var body: some View {
        Text("Insert your operation!")
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .foregroundColor(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 400, alignment: Alignment.bottomTrailing)
    }
}


struct NumberPad: View {
    var body: some View {
        VStack(){
            HStack(){
                ButtonNumberSeven()
                ButtonNumberEight()
                ButtonNumberNine()
            }
            HStack(){
                ButtonNumberFour()
                ButtonNumberFive()
                ButtonNumberSix()
            }
            HStack(){
                ButtonNumberOne()
                ButtonNumberTwo()
                ButtonNumberThree()
            }
            HStack(){
                ButtonNumberZero()
                ButtonComma()
            }
        }
    }
}

struct OperandPad: View {
    var body: some View{
        VStack{
            ButtonMultiplyOperation()
            ButtonSubstractOperation()
            ButtonPlusOperation()
            ButtonEqualOperation()
        }
    }
}

struct SpecialPad: View {
    var body: some View {
        HStack(){
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
            ButtonBasicOperationStyle(operation: "=")
        }
    }
}

struct ButtonPlusOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "+")
        }
    }
}

struct ButtonSubstractOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "-")
        }
    }
}

struct ButtonMultiplyOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "x")
        }
    }
}

struct ButtonDivideOperation: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "÷")
        }
    }
}

struct ButtonAllClear: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "AC")
        }
    }
}

struct ButtonChangeSign: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "+/-")
        }
    }
}

struct ButtonPercentage: View {
    var body: some View {
        Button(action: { print("Tap plus button")}){
            ButtonBasicOperationStyle(operation: "%")
        }
    }
}

struct ButtonNumberStyle: View {
    var digit: String
    
    var body: some View {
        Text(digit)
            .frame(width: 80, height: 80)
            .foregroundColor(.white)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color.gray)
            .cornerRadius(80)
    }
}

struct ButtonNumberLargeStyle: View {
    var digit: String
    
    var body: some View {
        Text(digit)
            .padding(.leading, 30)
            .frame(width: 160, height: 80, alignment: .leading)
            .foregroundColor(.white)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color.gray)
            .cornerRadius(80)
    
    }
}

struct ButtonBasicOperationStyle: View {
    var operation: String
    
    var body: some View {
        Text(operation)
            .frame(width: 80, height: 80)
            .foregroundColor(.white)
            .font(Font.custom("Montserrat-Bold", size: 30.0))
            .background(Color.orange)
            .cornerRadius(80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
