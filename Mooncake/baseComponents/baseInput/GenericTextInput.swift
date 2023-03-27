//
//  TextInput.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//

import SwiftUI
import Firebase

struct TextInputView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        HStack {
            if let symbolName = sfSymbol {
                Image(systemName: symbolName)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .padding(.leading, textFieldLeading)
                }
                TextField("", text: $text)
                    .keyboardType(keyboardType)
                    .padding(.leading, textFieldLeading)
            }
        }
        .frame(height: 44)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 1)
    }
}
