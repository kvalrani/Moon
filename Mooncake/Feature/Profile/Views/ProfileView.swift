//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    var body: some View {
            VStack(alignment: .leading
                   ) {
                Spacer()
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("First Name: \(service.userDetails?.firstName ?? "N/A")").font(Font.custom("Inter-SemiBold", size: 24))
                    Text("Last Name: \(service.userDetails?.lastName ?? "N/A")").font(Font.custom("Inter-SemiBold", size: 24))
                    Text("Occupation: \(service.userDetails?.occupation ?? "N/A")").font(Font.custom("Inter-SemiBold", size: 24))
                    Text("Gender: \(service.userDetails?.gender ?? "N/A")").font(Font.custom("Inter-SemiBold", size: 24))
                }
                Spacer()
                    
                    ButtonView(title: "Logout") {
                        service.logout()
                    }
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
