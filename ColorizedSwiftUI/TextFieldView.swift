//
//  TextFieldView.swift
//  ColorizedSwiftUI
//
//  Created by Дарья Кобелева on 20.04.2024.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldValue: String
    
    let action: () -> Void
    
    var body: some View {
        TextField(textFieldValue, text: $textFieldValue) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
}

struct SliderValueTF_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            TextFieldView(textFieldValue: .constant("128"), action: {})
        }
    }
}


