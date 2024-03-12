//
//  InscriptionListeCreneaux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import SwiftUI

struct InscriptionListeCreneaux: View {
    
    @State var jour: Int = 0
    
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Jour", selection: $jour){
                    Text("Jour 1").tag(0)
                    Text("Jour 2").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                //            VStack{
                //                Text("8h")
                //                Text("10h")
                //                Text("12h")
                //                Text("14h")
                //                Text("17h")
                //                Text("20h")
                //                Text("22h")
                //            }
                // Each text is a button for going into another view
                List{
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("8h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("10h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("12h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("14h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("17h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("20h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("22h")
                    }
                }
                
                
                // Bouton s'inscrire
                Button(action: {}, label: {
                    Text("S'inscrire")
                })
            }
            .navigationTitle("Festival 2024")
        }
        .padding()
    }
}
