//
//  ColorMixView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

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
