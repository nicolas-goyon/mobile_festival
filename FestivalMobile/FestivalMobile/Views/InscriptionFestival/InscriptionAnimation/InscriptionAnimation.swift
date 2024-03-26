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
        if viewModel.animationSelectList.selectedData.count == 0 {
            return "Aucun animation sélectionné"
        }
        var text = viewModel.animationSelectList.selectedData.map({ $0.name }).joined(separator: ", ")
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
//            Section{
//                NavigationLink(destination: FiltreJeux() ){
//                    Text("Fitres")
//                }
//            }
            Section(header: Text("Zones")){
                NavigationLink(destination: MultiSelectList(viewModel: viewModel.animationSelectList, showSearchBar: true).navigationTitle("Sélection zone") ){
                    Text("Selection zone")
                }
                Text(postesSelectionneText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Button(action: {
                viewModel.typeChoix = .Animation
            }) {
                Text("Valider les animation")
            }
            
            Button(action: {
                viewModel.typeChoix = .SansChoix
            }) {
                Text("Réinitialiser le choix")
            }.foregroundColor(.red)
        }
    }
}
