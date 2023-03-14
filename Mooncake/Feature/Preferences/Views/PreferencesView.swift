//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct PreferencesView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    @State private var cuisine: String = ""
    
    @State private var selectedPriceOptions = Set<String>()
        let priceOptions = ["$", "$$", "$$$", "$$$$"]
    
    @State private var selectedTimeOptions = Set<String>()
        let timeOptions = ["0-15 minutes", "15-30 minutes", "30-60 minutes", "60+ minutes"]
    
    var body: some View {
            VStack(alignment: .leading
                   ) {
                Spacer()
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    InputTextFieldView(text: $cuisine,
                                       placeholder: "Cuisine",
                                       keyboardType: .namePhonePad,
                                       systemImage: nil)
                    Text("Price:")
                    Picker(selection: $selectedPriceOptions, label: Text("")) {
                        ForEach(priceOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    
                    Text("Time-Sensitivity:")
                    Picker(selection: $selectedTimeOptions, label: Text("")) {
                        ForEach(timeOptions, id: \.self) { timeOptions in
                            Text(timeOptions)
                        }
                    }
                }
                Spacer()
                    
                    ButtonView(title: "Go!") {
                    }
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Preferences")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PreferencesView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
