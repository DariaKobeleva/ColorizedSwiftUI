//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    let color: Color
    
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    var body: some View {
        
        ZStack {
            Color(red: 39 / 255, green: 85 / 255, blue: 156 / 255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorMixView(
                    redSlider: $redSlider,
                    greenSlider: $greenSlider,
                    blueSlider: $blueSlider
                )
                
                ColorSliderView(
                    sliderValue: $redSlider,
                    colorSlider: "Red",
                    tintColor: .red
                )
                
                ColorSliderView(
                    sliderValue: $greenSlider,
                    colorSlider: "Green",
                    tintColor: .green
                )
                
                ColorSliderView(
                    sliderValue: $blueSlider,
                    colorSlider: "Blue",
                    tintColor: .blue
                )
                
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 12, trailing: 16))
            
        }
        
    }
}

#Preview {
    ContentView(color: .black)
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    let colorSlider: String
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(colorSlider):").foregroundStyle(.white)
            Text(lround(sliderValue).formatted()).foregroundStyle(.white)
                .bold()
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .colorMultiply(.white)
                .tint(tintColor)
            //            TextField("Enter your name", text: $sliderValue)
        }
    }
}

struct ColorMixView: View {
    @Binding var redSlider: Double
    @Binding var greenSlider: Double
    @Binding var blueSlider: Double
    
    var body: some View {
        Color(red: redSlider / 255 , green: greenSlider / 255, blue: blueSlider / 255)
            .frame(width: 343, height: 179)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}
