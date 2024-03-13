//
//  InscriptionAnimation.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

import SwiftUI

struct InscriptionAnimation : View {
    
    
    @StateObject var animations = MultiSelectListVM(data: [
        SelectionAnimationVM(animation: "Esplanade 1"),
        SelectionAnimationVM(animation: "Esplanade 2"),
        SelectionAnimationVM(animation: "Esplanade 3"),
        SelectionAnimationVM(animation: "Sud-Est"),
        SelectionAnimationVM(animation: "Sud-Ouest"),
        SelectionAnimationVM(animation: "Nord-Est"),
        SelectionAnimationVM(animation: "Nord-Ouest")
    ])
    
    
    @State private var selectedItems: [MultiSelectObjectVM<SelectionAnimationVM>] = []
    
    var postesSelectionneText: String {
        if selectedItems.count == 0 {
            return "Aucun animation sélectionné"
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
                NavigationLink(destination: FiltreJeux() ){
                    Text("Fitres")
                }
            }
            Section(header: Text("Zones")){
                NavigationLink(destination: SelectionAnimation(animation: animations, selectedItems: $selectedItems).navigationTitle("Sélection zone") ){
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
