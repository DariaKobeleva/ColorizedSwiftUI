//
//  ColorMixView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

struct ColorMixView: View {
    let redSlider: Double
    let greenSlider: Double
    let blueSlider: Double
    
    var body: some View {
        Color(red: redSlider / 255, green: greenSlider / 255, blue: blueSlider / 255)
            .frame(height: 180)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(
                color: Color(
                    red: redSlider / 255,
                    green: greenSlider / 255,
                    blue: blueSlider / 255
                ),
                radius: 8
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            ColorMixView(redSlider: 100, greenSlider: 100, blueSlider: 100)
        }
    }
}
