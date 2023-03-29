//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct PreferencesView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    
    
    @State private var health: String = "Any"
    let healthOptions = ["Any", "Healthy", "Junk Food"]
    
    @State private var cuisine: String = "Any"
    let cuisineOptions = ["Any", "Indian", "Chinese", "Thai", "French", "Mexican", "American", "Japanese", "Ethiopian"]
    
    @State private var price = "Any"
    let priceOptions = ["Any", "$", "$$", "$$$", "$$$$"]
    
    @State private var time = "Any"
        let timeOptions = ["Any", "<15 minutes", "<30 minutes", "<60 minutes"]
    
    @State private var allergy = "None"
    let allergyOptions = ["None", "Vegan", "Vegetarian", "Pescatarian"]
    
    
    var body: some View {
        
            VStack(alignment: .leading
            ) {
                Spacer()
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("Health:")
                    Picker(selection: $health, label: Text("")) {
                        ForEach(healthOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    Text("Cuisine:")
                    Picker(selection: $cuisine, label: Text("")) {
                        ForEach(cuisineOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    Text("Price:")
                    Picker(selection: $price, label: Text("")) {
                        ForEach(priceOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    
                    Text("Time-Sensitivity:")
                    Picker(selection: $time, label: Text("")) {
                        ForEach(timeOptions, id: \.self) { timeOptions in
                            Text(timeOptions)
                        }
                    }
                   
//                    Text("Dietary Preferences:")
//                    Picker("Options", selection: $allergy) {
//                        ForEach(allergyOptions, id: \.self) { option in
//                            Text(option)
//                        }
//                    }
                    //Text("Selected Option: //\(selectedAllergyOptions)")
                }
                Spacer()
                
                
                NavigationLink(destination: RecommendationView(health: health, cuisine: cuisine, price: price, time: time, allergy: allergy).environmentObject(service)) {
                    Text("Go!").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
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
                Spacer()
                
            }
            .padding(.horizontal, 16).navigationTitle("Preferences")
            
        
    }
}

struct OptionID: Hashable {
    let value: String
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        
            PreferencesView()
                .environmentObject(SessionServiceImpl())
        
    }
}
