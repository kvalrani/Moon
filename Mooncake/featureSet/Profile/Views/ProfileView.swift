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
        ZStack {
            VStack(alignment: .leading
            ) {
                Spacer()
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("First Name: \(service.userDetails?.firstName ?? "N/A")").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Last Name: \(service.userDetails?.lastName ?? "N/A")").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Occupation: \(service.userDetails?.occupation ?? "N/A")").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    Text("Gender: \(service.userDetails?.gender ?? "N/A")").font(.system(size: 24)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                }
                Spacer()
                
                NavigationLink(destination: HomeView().environmentObject(service)) {
                    Text("Home").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(.white)
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .border(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.37, green: 0.69, blue: 0.46), lineWidth: 2)
                        )
                    
                    //background: .clear,
                    //foreground: (Color(red: 0.37, green: 0.69, blue: 0.46)),
                    //border: (Color(red: 0.37, green: 0.69, blue: 0.46))
                }
                
                ButtonView(title: "Logout",
                           background: .white,
                           foreground: (Color(red: 0.37, green: 0.69, blue: 0.46)),
                           border: (Color(red: 0.37, green: 0.69, blue: 0.46))) {
                    service.logout()
                }
                
                Spacer()
                
            }
            .navigationTitle("Profile")
            .padding(.all, 10.0)
            .frame(width: nil, height: 500.0)
            .background(Color(red: 0.37, green: 0.69, blue: 0.46))
            .cornerRadius(20)
            //.applyClose()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {

            ProfileView()
                .environmentObject(SessionServiceImpl())
        
    }
}
