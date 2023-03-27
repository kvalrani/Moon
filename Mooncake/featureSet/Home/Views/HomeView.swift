//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    var body: some View {
            VStack(alignment: .leading
                   ) {
                
                Spacer()
                    
                  
                    NavigationLink(destination: PreferencesView()) {
                        Text("Recommendation").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                            .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                            .foregroundColor(Color.white)
                            .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                            .font(.system(size: 16, weight: .bold))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                            )
                    }
                    
                
        
                
                NavigationLink(destination: ProfileView().environmentObject(service)) {
                    Text("Profile").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(.clear)
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                        )
                }

                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
                .environmentObject(SessionServiceImpl())
    }
}
