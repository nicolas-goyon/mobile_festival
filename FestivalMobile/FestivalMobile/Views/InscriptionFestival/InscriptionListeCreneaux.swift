//
//  InscriptionListeCreneaux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import SwiftUI

struct InscriptionListeCreneaux: View {
    
    
    var viewModel : InscriptionCreneauxVM
    
    @State var jour: Int = 0
    
    
    
    var body: some View {
        NavigationStack{
            Form(content: {
                Picker("Jour", selection: $jour){
                    Text("Jour 1").tag(0)
                    Text("Jour 2").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List{
                    
                    ForEach(viewModel.creneaux, id: \.self){ creneau in
                        NavigationLink(destination: InscriptionCreneau(viewModel: creneau)){
                            Text("\(creneau.dateHeureDebut.formatted(.dateTime.hour().minute().locale(Locale(identifier: "fr_FR"))))")
                            SelectionPreview(viewModel: creneau)
                        }
                    }
                }
                
                
                // Bouton s'inscrire
                Button(action: {}, label: {
                    Text("Validation inscription")
                })
            })
            .navigationTitle("Festival 2024")
        }
        .padding()
    }
}
