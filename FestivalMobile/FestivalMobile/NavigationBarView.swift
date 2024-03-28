//
//  NavigationView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import SwiftUI

struct NavigationBarView: View {
    
    @ObservedObject var viewModel : VolunteerVM
    @State private var selectedView = "home"
    @ObservedObject var connectionToken = ConnexionToken.tokenInstance
    
    let color = UIColor(red: 115/255, green: 150/255, blue: 0/255, alpha: 1)
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("home")
            // print the following if connected (connectionToken.tokenInstance.token != nil)
            if connectionToken.token == nil {
                RegisterView()
                    .tabItem {
                        Label("Register", systemImage: "person.crop.circle.fill.badge.plus")
                    }
                    .tag("register")
                
                LoginView(selectedMenu: $selectedView)
                    .tabItem {
                        Label("Login", systemImage: "person.crop.circle.fill")
                    }
                    .tag("login")
            }
            else {
                ProfileView(viewModel: viewModel)
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                    .tag("profile")
                Button(action: {
                    ConnexionToken.tokenInstance.token = nil
                    selectedView = "home"
                }) {
                    Text("Logout")
                }
                .tabItem {
                    Label("Logout", systemImage: "person.crop.circle.fill.badge.minus")
                }
                .tag("logout")
            }
            
        }
        .accentColor(Color(color))
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            selectedView = "home"
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(viewModel: VolunteerVM())
    }
}
