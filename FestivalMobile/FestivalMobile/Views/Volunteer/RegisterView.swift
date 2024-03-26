//
//  RegisterView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 22/03/2024.
//

import SwiftUI
import iPhoneNumberField

struct RegisterView: View {
    
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var nbEditionPerformed : Int = 0
    @State var tshirtSize : TshirtSizeEnum = .M
    @State var lodging : LodgingEnum = .aucun
    @State var foodRegime : FoodRegimeEnum = .carnivore
    @State var address : String = ""
    @State var phone : String = ""
    @State var username : String = ""
    @State var avatarUrl : String = ""
    @StateObject var rvm = RegisterViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Register").font(.title)
                Form(content: {
                    Section("Required Information", content: {
                        
                        TextField("Firstname", text: $firstname)
                        TextField("Lastname", text: $lastname)
                        TextField("Email", text: $email)
                        SecureField("Password", text: $password)
                        Stepper("Number of Edition Performed : \(nbEditionPerformed)", value: $nbEditionPerformed, in: 0...130)
                        Picker("Tshirt Size", selection: $tshirtSize) {
                            ForEach(TshirtSizeEnum.allCases) { tshirt in
                                Text(tshirt.rawValue)
                            }
                        }
                        Picker("Lodging", selection: $lodging) {
                            ForEach(LodgingEnum.allCases) { lodgingField in
                                Text(lodgingField.rawValue)
                            }
                        }
                        Picker("Food Regime", selection: $foodRegime) {
                            ForEach(FoodRegimeEnum.allCases) { foodRegimeField in
                                Text(foodRegimeField.rawValue)
                            }
                        }
                    })
                    
                    Section("Optional Information", content: {
                        TextField("Address", text: $address)
                        iPhoneNumberField("Phone", text: $phone)
                            .flagHidden(false)
                            .flagSelectable(true)
                        TextField("Username", text: $username)
                        TextField("Avatar Url", text: $avatarUrl)
                    })
                    Button("Submit") {
                        Task {
                            await rvm.register(firstname: firstname, lastname: lastname, email: email, password: password, nbEditionPerformed: nbEditionPerformed, tshirtSize: tshirtSize, lodging: lodging, foodRegime: foodRegime, address: address, phone: phone, username: username, avatarUrl: avatarUrl)
                        }
                    }
                    
                })
            }
        }
    }
}

#Preview {
    RegisterView()
}
