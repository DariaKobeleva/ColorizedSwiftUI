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
    
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    @State private var redTextFieldValue = ""
    @State private var greenTextFieldValue = ""
    @State private var blueTextFieldValue = ""
    
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                ColorMixView(
                    redSlider: $redSlider,
                    greenSlider: $greenSlider,
                    blueSlider: $blueSlider
                )
                
                HStack(spacing: 8) {
                    VStack(spacing: 20) {
                        RGBSliderView(
                            sliderValue: $redSlider,
                            textFieldValue: $redTextFieldValue,
                            colorSlider: "Red",
                            tintColor: .red
                        )
                        
                        RGBSliderView(
                            sliderValue: $greenSlider,
                            textFieldValue: $greenTextFieldValue,
                            colorSlider: "Green",
                            tintColor: .green
                        )
                        
                        RGBSliderView(
                            sliderValue: $blueSlider,
                            textFieldValue: $blueTextFieldValue,
                            colorSlider: "Blue",
                            tintColor: .blue
                        )
                    }
                    
                    VStack(spacing: 14) {
                        TextFieldView(
                            sliderValue: $redSlider,
                            textFieldValue: $redTextFieldValue
                        )
                        .focused($activeTextField, equals: .red)
                        
                        TextFieldView(
                            sliderValue: $greenSlider,
                            textFieldValue: $greenTextFieldValue
                        )
                        .focused($activeTextField, equals: .green)
                        
                        TextFieldView(
                            sliderValue: $blueSlider,
                            textFieldValue: $blueTextFieldValue
                        )
                        .focused($activeTextField, equals: .blue)
                    }
                    
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                applyTextFieldsValue()
                                activeTextField = nil
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

private extension ContentView {
    func applyTextFieldsValue() {
        if let value = Double(redTextFieldValue), (0...255).contains(value) {
            redSlider = value
        }
        if let value = Double(greenTextFieldValue), (0...255).contains(value) {
            greenSlider = value
        }
        if let value = Double(blueTextFieldValue), (0...255).contains(value) {
            blueSlider = value
        }
    }
}

#Preview {
    ContentView()
}


