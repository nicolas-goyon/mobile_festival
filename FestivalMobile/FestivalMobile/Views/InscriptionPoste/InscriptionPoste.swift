//
//  InscriptionAnimation.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

import SwiftUI

struct InscriptionPoste : View {
    
    @StateObject var viewModel = MultiSelectListVM<SelectionPosteVM>(data: [
        SelectionPosteVM(poste: "Cuisine"),
        SelectionPosteVM(poste: "Vente"),
        SelectionPosteVM(poste: "Bar"),
        SelectionPosteVM(poste: "Accueil public"),
        SelectionPosteVM(poste: "Accueil bénévoles"),
        SelectionPosteVM(poste: "Tombola"),
        SelectionPosteVM(poste: "Buvette")
    ])
    
    @State private var selectedItems: [MultiSelectObjectVM<SelectionPosteVM>] = []
    
    var postesSelectionneText: String {
        if selectedItems.count == 0 {
            return "Aucun poste sélectionné"
        }
        var text = selectedItems.map({ $0.name }).joined(separator: ", ")
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
                NavigationLink(destination: SelectionPoste(postes: viewModel, selectedItems: $selectedItems).navigationTitle("Sélection des postes") ){
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
