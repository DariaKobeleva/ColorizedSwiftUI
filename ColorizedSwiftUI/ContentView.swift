//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorMixView(
                    redSlider: $redSlider,
                    greenSlider: $greenSlider,
                    blueSlider: $blueSlider
                )
                
                RGBSliderView(
                    sliderValue: $redSlider,
                    colorSlider: "Red",
                    tintColor: .red
                )
                
                RGBSliderView(
                    sliderValue: $greenSlider,
                    colorSlider: "Green",
                    tintColor: .green
                )
                
                RGBSliderView(
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
    ContentView()
}

struct RGBSliderView: View {
    @Binding var sliderValue: Double
    let colorSlider: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(colorSlider):").foregroundStyle(.gray)
                .frame(width: 54, alignment: .leading)
            
            Text(lround(sliderValue).formatted()).foregroundStyle(.gray)
                .bold()
                .frame(width: 35, alignment: .center)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
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
