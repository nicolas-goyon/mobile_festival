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
    
    var animations: MultiSelectListVM<SelectionAnimationVM> {
        viewModel.getAnimations()
    }
    
    
    
    
    var postesSelectionneText: String {
        if viewModel.choixPostes.count == 0 {
            return "Aucun poste sélectionné"
        }
        var text = viewModel.choixPostes.map({ $0.name }).joined(separator: ", ")
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
                NavigationLink(destination: SelectionPoste(postes: viewModel.getPostes(), selectedItems: $viewModel.choixPostes).navigationTitle("Sélection des postes") ){
                    Text("Postes")
                }
                Text(postesSelectionneText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Button(action: {
                print("Validation poste")
            }) {
                Text("Valider les postes")
            }
            
        }
    }
}
