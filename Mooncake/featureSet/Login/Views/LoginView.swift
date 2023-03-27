//
//  LoginView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var viewModel = LoginViewModelImpl(
        service: LoginServiceImpl()
    )
    
    let primaryColor = Color(red: 0.37, green: 0.69, blue: 0.46)
    let secondaryColor = Color.gray.opacity(0.5)
    let borderColor = Color.gray.opacity(0.25)
    let cornerRadius: CGFloat = {
        UIScreen.main.bounds.width < 375 ? 8 : 10 // Adjust the corner radius based on screen size
    }()
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $viewModel.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   systemImage: "envelope")
                
                InputPasswordView(password: $viewModel.credentials.password,
                                  placeholder: "Password",
                                  systemImage: "lock")
            }
            
            HStack {
                Spacer()
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                })
                .sheet(isPresented: $showForgotPassword) {
                        ForgotPasswordView()
                }
            }
            
            VStack(spacing: 16) {
                ButtonView(title: "Login") {
                    viewModel.login()
                }
                
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: primaryColor,
                           border: primaryColor) {
                    showRegistration.toggle()
                }
                .sheet(isPresented: $showRegistration) {
                        RegisterView()
                }
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
        .alert(isPresented: $viewModel.hasError) {
            let message: Text
            if case .failed(let error) = viewModel.state {
                message = Text(error.localizedDescription)
            } else {
                message = Text("Something went wrong")
            }
            return Alert(
                title: Text("Error"),
                message: message
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

/**
 * Button view component
 */

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    internal init(title: String,
                  background: Color = (Color(red: 0.37, green: 0.69, blue: 0.46)),
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        
        Button(action: {
            handler()
        }, label: {
            Text(title)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}


/**
 * Textfield input view component
 */

struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let systemImage: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        
        VStack {
            
            TextField(placeholder, text: $text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       minHeight: 44,
                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.leading, systemImage == nil ? textFieldLeading / 2 : textFieldLeading)
                .keyboardType(keyboardType)
                .background(
                    
                    ZStack(alignment: .leading) {
                        
                        if let systemImage = systemImage {
                            
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        
                        RoundedRectangle(cornerRadius: 10,
                                         style: .continuous)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    }
                )
        }
    }
}

struct InputPasswordView: View {
    
    @Binding var password: String
    let placeholder: String
    let systemImage: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        
        VStack {
            
            SecureField(placeholder, text: $password)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       minHeight: 44,
                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.leading, systemImage == nil ? textFieldLeading / 2 : textFieldLeading)
                .background(
                    
                    ZStack(alignment: .leading) {
                        
                        if let systemImage = systemImage {
                            
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        
                        RoundedRectangle(cornerRadius: 10,
                                         style: .continuous)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    }
                )
        }
    }
}
