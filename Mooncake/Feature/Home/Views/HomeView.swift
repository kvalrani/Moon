//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    @State private var showProfile = false

    
    var body: some View {
            VStack(alignment: .leading
                   ) {
                
                Spacer()
                    ButtonView(title: "Preferences") {
                        service.logout()
                    }
                    ButtonView(title: "Recommendation") {
                        service.logout()
                    }
                    ButtonView(title: "Feedback") {
                        service.logout()
                    }
                
                Spacer()
                
                    ButtonView(title: "Profile") {
                        showProfile.toggle()
                    }.sheet(isPresented: $showProfile){
                        ProfileView()
                    }
                    ButtonView(title: "Logout") {
                        service.logout()
                    }
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
