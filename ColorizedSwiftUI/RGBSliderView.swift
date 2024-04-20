//
//  RGBSliderView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

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
