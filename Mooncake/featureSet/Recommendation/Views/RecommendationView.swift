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
    var nameM: String = ""
    var cuisineM: String = ""
    var healthM: String = ""
          var priceM: String = ""
          var timeM: Int = 0
    
    let data = FoodData.foodData
    
    func findMatchedRestaurant() -> [Any] {
            var matches: [[Any]] = []
            guard let unwrappedData = data else { return [] }
            for (key, entry) in unwrappedData.enumerated() {
                
                guard let entryDict = entry.value as? [String: Any],
                      let rank = Int(entry.key),
                      let name = entryDict["Name"] as? String,
                      let entryCuisine = entryDict["Cuisine"] as? String,
                      let entryHealth = entryDict["Health"] as? Int,
                      let entryPrice = entryDict["Price"] as? Int,
                      let entryTime = entryDict["Time"] as? Int
                      else { continue }
            
            var modPrice:Int = 0
            if price == "$" {
                modPrice = 1
            }
            if price == "$$" {
                modPrice = 2
            }
            if price == "$$$" {
                modPrice = 3
            }
            if price == "$$$$" {
                modPrice = 4
            }
            if price == "Any" {
                modPrice = 0
            }
            
            
            var modTime:Int = 0
            if time == "Any" {
                modTime = 0
            }
            if time == "<15 minutes" {
                modTime = 15
            }
            if time == "<30 minutes" {
                modTime = 30
            }
            if time == "<60 minutes" {
                modTime = 60
            }
            if time == "60+ minutes" {
                modTime = 500
            }
            
            var modHealth:Int = 0
            if health == "Junk Food" {
                modHealth = 3
            }
            if health == "Healthy" {
                modHealth = 1
            }
            if health == "Any" {
                modHealth = 0
            }
                
                var modEntryHealth:String = ""
                if entryHealth == 3 {
                    modEntryHealth = "Junk Food"
                }
                else if entryHealth == 2 {
                    modEntryHealth = "Medium"
                }
                else if entryHealth == 1 {
                    modEntryHealth = "Healthy"
                }
                
                var modEntryPrice:String = ""
                if entryPrice == 1 {
                    modEntryPrice = "$"
                }
                else if entryPrice == 2 {
                    modEntryPrice = "$$"
                }
                else if entryPrice == 3 {
                    modEntryPrice = "$$$"
                }
                else if entryPrice == 4 {
                    modEntryPrice = "$$$$"
                }
     
        
            
            if (cuisine == "Any") {
                
                if(modPrice > 0) {
                    if(modHealth > 0) {
                        if(modTime > 0) {
                            if ((entryPrice == modPrice) && (entryHealth == modHealth) && (entryTime < modTime)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryPrice == modPrice) && (entryHealth == modHealth)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    else {
                        if(modTime > 0) {
                            if ((entryPrice == modPrice) && (entryTime < modTime)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryPrice == modPrice)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    
                }
                else {
                    if(modHealth > 0) {
                        if(modTime > 0) {
                            if ((entryHealth == modHealth) && (entryTime < modTime)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryHealth == modHealth)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    else {
                        if(modTime > 0) {
                            if ((entryTime < modTime)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if(modPrice > 0)
                            {
                                if ((entryPrice == modPrice)) {
                                    print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                    var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                    matches.append(myArray)
                                }
                            }
                            else {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                }
            }
            else {
                if(modPrice > 0) {
                    if(modHealth > 0) {
                        if(modTime > 0) {
                            if ((entryPrice == modPrice) && (entryHealth == modHealth) && (entryTime < modTime) && (entryCuisine == cuisine)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryPrice == modPrice) && (entryHealth == modHealth) && (entryCuisine == cuisine)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    else {
                        if(modTime > 0) {
                            if ((entryPrice == modPrice) && (entryTime < modTime) && (entryCuisine == cuisine)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryPrice == modPrice) && (entryCuisine == cuisine)) {
                                   print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    
                }
                else {
                    if(modHealth > 0) {
                        if(modTime > 0) {
                            if ((entryPrice == modPrice) && (entryHealth == modHealth) && (entryTime < modTime) && (entryCuisine == cuisine)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryHealth == modHealth) && (entryCuisine == cuisine)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                    else {
                        if(modTime > 0) {
                            if ((entryTime < modTime) && (entryCuisine == cuisine)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                            
                        }
                        else {
                            if ((entryCuisine == cuisine)) {
                                print("Match found! Name: \(name), Cuisine: \(cuisine), Price: \(price), Time: \(time) ")
                                var myArray: [Any] = [rank, name, entryCuisine, modEntryHealth, modEntryPrice, entryTime]
                                matches.append(myArray)
                            }
                        }
                    }
                }
                
            }
            

        }
        var smallestRank = 1000
        for item in matches {
            if let array = item as? [Any] {
                // perform operations on the array
                if let r = array[0] as? Int {
                    if (r < smallestRank) {
                        smallestRank = r
                    }
                }
                
            }
            
        }
        
        for item in matches {
            if let array = item as? [Any] {
                // perform operations on the array
                if let r = array[0] as? Int {
                    if (r == smallestRank) {
                        print(array)
                        return array
                    }
                }
                
            }
        }
        return []
                
    }
    
    var body: some View {
        
        let matchedRestaurant: [Any] = findMatchedRestaurant()

        ZStack {
            VStack(alignment: .leading
            ) {
    
                Spacer()
                HStack
                {
                    Spacer()
                    //Kunal and Kush to change name
                    Text("\(NSString(string: "\(matchedRestaurant[1])")) ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer()
                
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    
                    //Kunal and Kush to change these
                    Text("Cuisine: \(NSString(string: "\(matchedRestaurant[2])"))").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Time: \(NSString(string: "\(matchedRestaurant[5])"))").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Cost: \(NSString(string: "\(matchedRestaurant[4])"))").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Health: \(NSString(string: "\(matchedRestaurant[3])"))").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    //Text("Dietry Preferences: \(allergy)").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
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

