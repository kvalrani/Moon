//
//  OrderPlaced.swift
//  Mooncake
//
//  Created by Alex Ruhl on 2/11/23.
//

import SwiftUI

struct OrderPlaced: View {
    var body: some View {
        ZStack {
            Color(red: 0.37, green: 0.69, blue: 0.46)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                            
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("Order Placed")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                        .bold()
                    
                    Text("Your order has been placed! Please open the delivery app to track your order.")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer().frame(height:0)

                    VStack(alignment: .center, spacing: 5) {
                        
                        Button(action: {
                            // Perform action when button is tapped
                        }) {
                            Text("Open Delivery App")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                                .cornerRadius(25)
                        }
                        
                        Button(action: {
                            // Perform action when button is tapped
                        }) {
                            Text("Go Home")
                                .font(.body)
                                .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                                .padding()
                                .background(.white)
                                .cornerRadius(25)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                        
                Spacer()
            }
        }
    }
}

struct OrderPlaced_Previews: PreviewProvider {
    static var previews: some View {
        OrderPlaced()
            
    }
}
