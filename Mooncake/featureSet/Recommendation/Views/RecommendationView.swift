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
        NavigationView {
            VStack(alignment: .leading
            ) {
                Spacer()
                HStack
                {
                    Spacer()
                    Text("Zahav")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer()
                
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("Cuisine: Israeli").font(Font.custom("Inter-SemiBold", size: 24)).multilineTextAlignment(.center)
                    Text("Time: 1.5 hours").font(Font.custom("Inter-SemiBold", size: 24))
                    Text("Cost: $$$$").font(Font.custom("Inter-SemiBold", size: 24))
                }
                Spacer()
                NavigationLink(destination: FeedbackView()) {
                    Text("Yes!").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(Color.clear)
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .font(.system(size: 30, weight: .bold))
                        .cornerRadius(10)
                }
                HStack {
                    Spacer()
                    Button("Give me another option!") {
                        
                    }
                    Spacer()
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Recommendation")
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecommendationView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
