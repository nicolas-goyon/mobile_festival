//
//  InscriptionAnimation.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

import SwiftUI

struct InscriptionAnimation : View {
    
    
    @ObservedObject var viewModel : CreneauChoixVM
    
    
    
    
    var postesSelectionneText: String {
        if viewModel.choixAnimations.count == 0 {
            return "Aucun animation sélectionné"
        }
        var text = viewModel.choixAnimations.map({ $0.name }).joined(separator: ", ")
        let maxSize = 25
        if text.count > maxSize {
            let index = text.index(text.startIndex, offsetBy: maxSize)
            text = String(text[..<index])
            text = text + "..."
        }
        return text
    }
    
    var body: some View{
        Form{
            Section{
                NavigationLink(destination: FiltreJeux() ){
                    Text("Fitres")
                }
            }
            Section(header: Text("Zones")){
                NavigationLink(destination: SelectionAnimation(animation: viewModel.getAnimations(), selectedItems: $viewModel.choixAnimations).navigationTitle("Sélection zone") ){
                    Text("Selection zone")
                }
                Text(postesSelectionneText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Button(action: {
                print("Validation poste")
            }) {
                Text("Valider les animation")
            }
            
        }
    }
}
