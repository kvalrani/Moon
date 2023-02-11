//
//  RatingFood.swift
//  Mooncake
//
//  Created by Alex Ruhl on 2/11/23.
//

import SwiftUI

struct RatingFood: View {
    @State private var selectedStars = 0

    var body: some View {
        ZStack {
            Color(red: 0.37, green: 0.69, blue: 0.46)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                            
                VStack(alignment: .center, spacing: 15) {
                    Spacer().frame(height:0)

                    HStack {
                        ForEach(0 ..< 5, id: \.self) { index in
                            Image(systemName: self.selectedStars >= index + 1 ? "star.fill" : "star")
                                .font(.system(size: 25))
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    self.selectedStars = index + 1
                                }
                        }
                    }
                    Spacer().frame(height:0)
                                        
                    Text("Rate Today's Food!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                    
                    Text("Please give a ranking of whether you liked today’s meal choice in order to improve our algorithm and create better choices for you")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer().frame(height:0)

                    VStack(alignment: .center, spacing: 5) {
                        
                        Button(action: {
                            // Perform action when button is tapped
                        }) {
                            Text("Submit Rating")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                                .cornerRadius(25)
                        }
                        Spacer().frame(height:0)
                        
                    }
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(20)
                        
                Spacer()
            }
        }
    }
}

struct RatingFood_Previews: PreviewProvider {
    static var previews: some View {
        RatingFood()
    }
}
