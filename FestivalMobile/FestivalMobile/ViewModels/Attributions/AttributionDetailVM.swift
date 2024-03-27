//
//  AttributionDetailVM.swift
//  TPS
//
//  Created by etud on 26/03/2024.
//

import Foundation


class AttributionDetailVM: ObservableObject{
    var poste: String
    var dateHeureDebut : Date
    var dateHeureFin : Date
    var description : String
    var jeux: [String]
    
    init(poste: String, dateHeureDebut: Date, dateHeureFin: Date, description: String, jeux: [String]){
        self.poste = poste
        self.dateHeureDebut = dateHeureDebut
        self.dateHeureFin = dateHeureFin
        self.description = description
        self.jeux = jeux
    }
}
