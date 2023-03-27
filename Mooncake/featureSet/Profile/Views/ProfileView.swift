//
//  HomeView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    let cornerRadius: CGFloat = 10
    
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
                NavigationLink(destination: HomeView().environmentObject(service)) {
                    Text("Home").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(.clear)
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                        )
                    
                //background: .clear,
                //foreground: (Color(red: 0.37, green: 0.69, blue: 0.46)),
                //border: (Color(red: 0.37, green: 0.69, blue: 0.46))
                }
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Profile")
            //.applyClose()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {

            ProfileView()
                .environmentObject(SessionServiceImpl())
        
    }
}
