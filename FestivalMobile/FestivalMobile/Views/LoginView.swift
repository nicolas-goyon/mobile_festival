//
//  LoginView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var userEmail : String = ""
    @State var password : String = ""
    @StateObject var lvm = LoginViewModel()
    @Binding var selectedMenu: String

    var body: some View {
            
            ZStack {
                VStack(alignment: .center, spacing: 20) {
                    Text("Log in").font(.title)
                    TextField("john.doe[at]gmail.com", text: $userEmail)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    
                    HStack{
                        Button("Log in") {
                            Task{
                                let res = await lvm.login(email: self.userEmail, password: self.password)
                                if res != nil {
                                    ConnexionToken.tokenInstance.token = res!
                                    selectedMenu = "home"
                                    
                                }
                            }
                        }
                        .padding(10)
                        .frame(width: 138)
                        .background(.green.opacity(0.25))
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.green, lineWidth: 1))
                    }
                }
                .alert("Accès refusé", isPresented: $lvm.invalid) {
                    Button("Quitter") {
                        lvm.logPressed()
                    }
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x:0, y:850))
        }
    
}
