//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 19.04.2024.
//

import SwiftUI

enum ActiveTextField {
    case red, green, blue
}

struct ContentView: View {
    @FocusState private var activeTextField: ActiveTextField?
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redTextFieldValue = ""
    @State private var greenTextFieldValue = ""
    @State private var blueTextFieldValue = ""
    
    @State private var isPresented = false
    
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                ColorMixView(
                    redSlider: $redSliderValue,
                    greenSlider: $greenSliderValue,
                    blueSlider: $blueSliderValue
                )
                
                HStack(spacing: 8) {
                    VStack(spacing: 20) {
                        RGBSliderView(
                            sliderValue: $redSliderValue,
                            textFieldValue: $redTextFieldValue,
                            colorSlider: "Red",
                            tintColor: .red
                        )
                        
                        RGBSliderView(
                            sliderValue: $greenSliderValue,
                            textFieldValue: $greenTextFieldValue,
                            colorSlider: "Green",
                            tintColor: .green
                        )
                        
                        RGBSliderView(
                            sliderValue: $blueSliderValue,
                            textFieldValue: $blueTextFieldValue,
                            colorSlider: "Blue",
                            tintColor: .blue
                        )
                    }
                    
                    VStack(spacing: 14) {
                        TextFieldView(
                            sliderValue: $redSliderValue,
                            textFieldValue: $redTextFieldValue
                        )
                        .focused($activeTextField, equals: .red)
                        
                        TextFieldView(
                            sliderValue: $greenSliderValue,
                            textFieldValue: $greenTextFieldValue
                        )
                        .focused($activeTextField, equals: .green)
                        
                        TextFieldView(
                            sliderValue: $blueSliderValue,
                            textFieldValue: $blueTextFieldValue
                        )
                        .focused($activeTextField, equals: .blue)
                    }
                    
                    //Не поняла, как вынести в отдельный modifier toolbar, проблема возникла с  activeTextField.
                    //Может и не надо выносить
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done", action: {
                                applyTextFieldsValue()
                                activeTextField = nil
                            })
                            .alert("Invalid Input", isPresented: $isPresented, actions: {}) {
                                Text("Enter value between 0 and 255")
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 12, trailing: 16))
                Spacer()
            }
            .padding(.top, 24)
        }
    }
}

//Алексей, подскажите пожалуйста, как убрать дублирование кода в этой функции?)
private extension ContentView {
    func applyTextFieldsValue() {
        if let value = Double(redTextFieldValue), (0...255).contains(value) {
            redSliderValue = value
        } else {
            redTextFieldValue = lround(redSliderValue).formatted()
            isPresented.toggle()
        }
        
        if let value = Double(greenTextFieldValue), (0...255).contains(value) {
            greenSliderValue = value
        } else {
            greenTextFieldValue = lround(greenSliderValue).formatted()
            isPresented.toggle()
        }
        
        if let value = Double(blueTextFieldValue), (0...255).contains(value) {
            blueSliderValue = value
        } else {
            blueTextFieldValue = lround(blueSliderValue).formatted()
            isPresented.toggle()
        }
    }
}

#Preview {
    ContentView()
}


