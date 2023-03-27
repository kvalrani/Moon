//
//  RatingFood.swift
//  Mooncake
//
//  Created by Alex Ruhl on 2/11/23.
//

import SwiftUI

struct FeedbackView: View {
    @EnvironmentObject var service: SessionServiceImpl
    
    @State private var selectedStarsQ = 0
    @State private var selectedStarsC = 0
    @State private var selectedStarsT = 0

    var body: some View {
        
            ZStack {
                Color(red: 0.37, green: 0.69, blue: 0.46)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10.0) {
                        Spacer().frame(height:0)
                        Text("Rate Today's Food!")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                        Text("Quality")
                            .font(.title)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .bold()
                        HStack {
                            ForEach(0 ..< 5, id: \.self) { index in
                                Image(systemName: self.selectedStarsQ >= index + 1 ? "star.fill" : "star")
                                    .font(.system(size: 25))
                                    .foregroundColor(.yellow)
                                    .onTapGesture {
                                        self.selectedStarsQ = index + 1
                                    }
                            }
                            
                            
                        }
                        
                        VStack {
                            
                            Text("Cost")
                                .font(.title)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .bold()
                            HStack {
                                ForEach(0 ..< 5, id: \.self) { index in
                                    Image(systemName: self.selectedStarsC >= index + 1 ? "star.fill" : "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            self.selectedStarsC = index + 1
                                        }
                                }
                            }
                        }
                        VStack {
                            Text("Time")
                                .font(.title)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .bold()
                            HStack {
                                ForEach(0 ..< 5, id: \.self) { index in
                                    Image(systemName: self.selectedStarsT >= index + 1 ? "star.fill" : "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            self.selectedStarsT = index + 1
                                        }
                                }
                                
                                
                            }
                        }
                        
                        Spacer().frame(height:0)
                        
                        
                        
                        Text("Please give a ranking of each component of today’s meal choice in order to improve our algorithm and create better choices for you")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer().frame(height:0)
                        
                        VStack(alignment: .center, spacing: 5) {
                            NavigationLink(destination: HomeView().environmentObject(service)) {
                                Text("Submit Rating").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                                    .background(Color.clear)
                                    .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                                    .font(.system(size: 30, weight: .bold))
                                    .cornerRadius(10)
                            }
                            /*
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
                             */
                            Spacer().frame(height:0)
                            
                        }
                    }
                    .padding(.all, 10.0)
                    .frame(width: nil)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    Spacer()
                }
            
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
