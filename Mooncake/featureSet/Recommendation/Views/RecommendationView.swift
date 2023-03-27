//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct RecommendationView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    var body: some View {
        ZStack {
                        
            VStack(alignment: .leading
            ) {
    
                Spacer()
                HStack
                {
                    Spacer()
                    Text("Zahav")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer()
                
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("Cuisine: Israeli").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Time: 1.5 hours").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Cost: $$$$").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Health: Medium").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Allergies: None").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                }
                Spacer()
                Spacer()
                NavigationLink(destination: FeedbackView().environmentObject(service)) {
                    Text("Yes!").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(.white)
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                        )
                }
                HStack {
                    
                    NavigationLink(destination: RecommendationView().environmentObject(service)) {
                        Text("Give Me Another Option!").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                            .background(.white)
                            .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                            .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                            .font(.system(size: 16, weight: .bold))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                            )
                    }
                }
                
                Spacer()
                Spacer()
                
            }
            .frame(height: 500.0)
            .navigationTitle("Recommendation")
            .padding(.all, 10.0)
            .background(Color(red: 0.37, green: 0.69, blue: 0.46))
            .cornerRadius(20)
            
            
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {

            RecommendationView()
                .environmentObject(SessionServiceImpl())

    }
}
