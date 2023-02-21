//
//  ContentView.swift
//  Mooncake
//
//  Created by Kunal Valrani on 2/6/23.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    @State var username: String = "Username"
    @State var password: String = "Password"
    var body: some View {
        VStack {
            
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            Spacer()
            TextField("Username", text: $username).textFieldStyle(.roundedBorder).font(Font.custom("Inter-Medium", size: 16))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                .frame(maxWidth: 250.00, minHeight: 19.00, alignment: .topLeading).padding()
            TextField("Password", text: $password).textFieldStyle(.roundedBorder).font(Font.custom("Inter-Medium", size: 16))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                .frame(maxWidth: 250.00, minHeight: 19.00, alignment: .topLeading)
            Spacer()
            Button(action: {
                print("Welcome!")
            }) {
                Text("Sign Up")
                  .font(Font.custom("Inter-SemiBold", size: 20))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color.white)
                  .frame(minWidth: 161.00, minHeight: 50.00, alignment: .center)
            }.background(Color(red: 0.37, green: 0.69, blue: 0.46))
                .cornerRadius(25).padding()
            Button(action: {
                print("Welcome!")
            }) {
                Text("Log In")
                  .font(Font.custom("Inter-SemiBold", size: 20))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color.white)
                  .frame(minWidth: 161.00, minHeight: 50.00, alignment: .center)
            }.background(Color(red: 0.37, green: 0.69, blue: 0.46))
                .cornerRadius(25)
            Spacer()
            
        }
    }
    
    
}

struct ProfileView: View {
    @State var username: String = "Username"
    @State var password: String = "Password"
    var body: some View {
        VStack {
            
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            Spacer()
            TextField("Username", text: $username).textFieldStyle(.roundedBorder).font(Font.custom("Inter-Medium", size: 16))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                .frame(maxWidth: 250.00, minHeight: 19.00, alignment: .topLeading).padding()
            TextField("Password", text: $password).textFieldStyle(.roundedBorder).font(Font.custom("Inter-Medium", size: 16))
                .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                .frame(maxWidth: 250.00, minHeight: 19.00, alignment: .topLeading)
            Spacer()
            Button(action: {
                print("Welcome!")
            }) {
                Text("Sign Up")
                  .font(Font.custom("Inter-SemiBold", size: 20))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color.white)
                  .frame(minWidth: 161.00, minHeight: 50.00, alignment: .center)
            }.background(Color(red: 0.37, green: 0.69, blue: 0.46))
                .cornerRadius(25).padding()
            Button(action: {
                print("Welcome!")
            }) {
                Text("Log In")
                  .font(Font.custom("Inter-SemiBold", size: 20))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color.white)
                  .frame(minWidth: 161.00, minHeight: 50.00, alignment: .center)
            }.background(Color(red: 0.37, green: 0.69, blue: 0.46))
                .cornerRadius(25)
            Spacer()
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        Group {
            ContentView()
            ProfileView()
        }

    }
}


