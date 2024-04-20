//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var isTextFieldFocused: Bool
    
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
                        
                        TextFieldView(
                            sliderValue: $greenSlider,
                            textFieldValue: $greenTextFieldValue
                        )
                        
                        TextFieldView(
                            sliderValue: $blueSlider,
                            textFieldValue: $blueTextFieldValue
                        )
                    }
                    .focused($isTextFieldFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isTextFieldFocused = false
                                
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

#Preview {
    ContentView()
}

struct RGBSliderView: View {
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    
    let colorSlider: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(colorSlider):").foregroundStyle(.gray)
                .frame(width: 54, height: 30, alignment: .leading)
            
            Text(lround(sliderValue).formatted()).foregroundStyle(.gray)
                .bold()
                .frame(width: 35, height: 30, alignment: .center)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .onChange(of: sliderValue) {
                    textFieldValue = String(format: "%.0f", sliderValue)
                }
                .colorMultiply(.white)
                .tint(tintColor)
        }
    }
}

struct ColorMixView: View {
    @Binding var redSlider: Double
    @Binding var greenSlider: Double
    @Binding var blueSlider: Double
    
    var color: Color {
        Color(red: redSlider / 255,
              green: greenSlider / 255,
              blue: blueSlider / 255
        )
    }
    
    var body: some View {
        color
            .frame(width: 343, height: 179)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(color: color, radius: 8)
    }
}

struct TextFieldView: View {
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    
    var body: some View {
        TextField(textFieldValue, text: $textFieldValue, onCommit: {
            if let value = Double(textFieldValue), (0...255).contains(value) {
                sliderValue = value
            }
        })
        
        .frame(width: 45)
        .multilineTextAlignment(.center)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .onAppear {
            textFieldValue = String(format: "%.0f", sliderValue)
        }
        .keyboardType(.numberPad)
    }
}
