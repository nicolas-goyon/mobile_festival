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
                    ForEach(0..<viewModel.journees.count){ index in
                        Text(formatDate(viewModel.journees[index])).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List{
                    
                    ForEach(viewModel.getCreneauxByDate(journee: viewModel.journees[jour]), id: \.self){ creneau in
                        NavigationLink(destination: InscriptionCreneau(viewModel: creneau)){
                            Text("\(creneau.dateHeureDebut.formatted(.dateTime.hour().minute().locale(Locale(identifier: "fr_FR"))) ) - \(creneau.dateHeureFin.formatted(.dateTime.hour().minute().locale(Locale(identifier: "fr_FR"))))")
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
    
    
    func formatDate(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "EEEE d MMMM"
        return formatter.string(from: date).prefix(3) + " " + formatter.string(from: date).components(separatedBy: " ")[1]
    }
}
