//
//  NavigationView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var selectedView = "home"
    
    let color = UIColor(red: 115/255, green: 150/255, blue: 0/255, alpha: 1)
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("home")
            
            RegisterView()
                .tabItem {
                    Label("Register", systemImage: "person.crop.circle.fill.badge.plus")
                }
                .tag("register")

            LoginView()
                .tabItem {
                    Label("Login", systemImage: "person.crop.circle.fill")
                }
                .tag("login")
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
        NavigationBarView()
    }
}
