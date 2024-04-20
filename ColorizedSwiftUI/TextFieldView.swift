//
//  TextFieldView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    
    var body: some View {
        TextField(textFieldValue, text: $textFieldValue)
            .frame(width: 45)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onAppear {
                textFieldValue = String(format: "%.0f", sliderValue)
            }
        
            .keyboardType(.numberPad)
    }
}
