//
//  RechercheJeuViewModel.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation



class RechercheJeuVM : Identifiable, ObservableObject, Hashable{
    static func == (lhs: RechercheJeuVM, rhs: RechercheJeuVM) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id : UUID = UUID()
    public private(set) var jeu : String
    public var estSelectionne: Bool
    
    init(jeu: String, estSelectionne: Bool){
        self.jeu = jeu
        self.estSelectionne = estSelectionne
    }
    
    
    func toogleSelection(){
        estSelectionne = !estSelectionne
    }
    
}
