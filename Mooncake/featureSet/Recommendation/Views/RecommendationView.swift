//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI
import Foundation

struct RecommendationView: View {
    
    @EnvironmentObject var service: SessionServiceImpl

      let health: String
      let cuisine: String
      let price: String
      let time: String
      let allergy: String

      init(health: String, cuisine: String, price: String, time: String, allergy: String) {
          self.health = health
          self.cuisine = cuisine
          self.price = price
          self.time = time
          self.allergy = allergy
      }
    
    let data = FoodData.foodData
    
    func findMatchedRestaurant() -> String? {
        guard let unwrappedData = data else { return nil }
        for entry in unwrappedData.values {
            guard let entryDict = entry as? [String: Any],
                  let name = entryDict["Name"] as? String,
                  let entryCuisine = entryDict["Cuisine"] as? String,
                  let entryHealth = entryDict["Health"] as? Int,
                  let entryPrice = entryDict["Price"] as? Int,
                  let entryTime = entryDict["Time"] as? Int
                  else { continue }

            //Kunal and Kush to wrap this up ....
            if entryCuisine == cuisine{
                   print("Match found! Name: \(name), Cuisine: \(cuisine), ")
            }
        }
        return nil
    }
    
    var body: some View {
        
        let matchedRestaurant = findMatchedRestaurant()

        ZStack {
            VStack(alignment: .leading
            ) {
    
                Spacer()
                HStack
                {
                    Spacer()
                    //Kunal and Kush to change name
                    Text("Zahav")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer()
                
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    
                    //Kunal and Kush to change these
                    Text("Cuisine: \(cuisine)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Time: \(time)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Cost: \(price)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Health: \(health)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Dietry Preferences: \(allergy)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
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
                    
                    NavigationLink(destination: RecommendationView(health: health, cuisine: cuisine, price: price, time: time, allergy: allergy).environmentObject(service)) {
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

