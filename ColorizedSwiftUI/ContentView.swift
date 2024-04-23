//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var activeTextField: ActiveTextField?
    
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 40) {
                ColorMixView(
                    redSlider: redSliderValue,
                    greenSlider: greenSliderValue,
                    blueSlider: blueSliderValue
                )
                
                VStack(spacing: 20) {
                    RGBSliderView(
                        value: $redSliderValue,
                        colorSlider: "Red",
                        tintColor: .red
                    )
                    .focused($activeTextField, equals: .red)
                    
                    RGBSliderView(
                        value: $greenSliderValue,
                        colorSlider: "Green",
                        tintColor: .green
                    )
                    .focused($activeTextField, equals: .red)
                    RGBSliderView(
                        value: $blueSliderValue,
                        colorSlider: "Blue",
                        tintColor: .blue
                    )
                    .focused($activeTextField, equals: .red)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            activeTextField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .onTapGesture {
                activeTextField = nil
            }
        }
    }
}


extension ContentView {
    private enum ActiveTextField {
        case red, green, blue
    }
    private func nextField() {
        switch activeTextField {
        case .red:
            activeTextField = .green
        case .green:
            activeTextField = .blue
        case .blue:
            activeTextField = .red
        case .none:
            activeTextField = nil
        }
    }
    
    private func previousField() {
        switch activeTextField {
        case .red:
            activeTextField = .blue
        case .green:
            activeTextField = .red
        case .blue:
            activeTextField = .green
        case .none:
            activeTextField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

