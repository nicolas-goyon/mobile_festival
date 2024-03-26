//
//  InscriptionAnimation.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI

struct InscriptionPoste : View {
    
    
    @ObservedObject var viewModel : CreneauChoixVM
    
    
    
    var postesSelectionneText: String {
        if viewModel.posteSelectList.selectedData.count == 0 {
            return "Aucun poste sélectionné"
        }
        var text = viewModel.posteSelectList.selectedData.map({ $0.name }).joined(separator: ", ")
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
                NavigationLink(destination: MultiSelectList(viewModel: viewModel.posteSelectList, showSearchBar: true).navigationTitle("Sélection des postes") ){
                    Text("Postes")
                }
                Text(postesSelectionneText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Button(action: {
                viewModel.typeChoix = .Poste
            }) {
                Text("Valider les postes")
            }
            
            Button(action: {
                viewModel.typeChoix = .SansChoix
            }) {
                Text("Réinitialiser le choix")
            }.foregroundColor(.red)
        }
    }
}
