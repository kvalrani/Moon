//
//  TextInput.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//

import SwiftUI

struct TextInputView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(
        text: .constant(""),
        placeholder: "Email",
        keyboardType: .emailAddress,
        sfSymbol: "envelope")
    }
}
  
