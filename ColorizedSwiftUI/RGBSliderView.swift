//
//  RGBSliderView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

struct RGBSliderView: View {
    
    @Binding var value: Double
    
    let colorSlider: String
    let tintColor: Color
    
    @State private var showAlert = false
    @State private var text = ""
    
    var body: some View {
        HStack(spacing: 5) {
            //Текст RED/GREEN/BLUE
            Text("\(colorSlider):")
                .foregroundStyle(.gray)
                .frame(width: 54, alignment: .leading)
            
            //Текст для числового отображения значения слайдера
            Text(value.formatted())
                .frame(width: 35, alignment: .leading)
                .foregroundStyle(.gray)
                .bold()
            
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value) { _, newValue in
                    text = newValue.formatted()
                }
                .colorMultiply(.white)
                .tint(tintColor)
            
            TextFieldView(textFieldValue: $text, action: checkValue)
                .alert("Invalid Input", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value between 0 and 255")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Double(text), (0...255).contains(value) {
            self.value = value
        } else {
            showAlert.toggle()
            value = 0
            text = "0"
        }
    }
}

struct RGBSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            RGBSliderView(value: .constant(100), colorSlider: "Red", tintColor: .red)
        }
    }
}
