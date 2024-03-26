//
//  Poste.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class Poste {
        
    public private(set) var _id :           Int
    public private(set) var nom :           String
    public private(set) var description :   String
    public private(set) var capacite_max :  Int
    
    init(id : Int, nom : String, description : String, capacite_max : Int){
        self._id = id
        self.nom = nom
        self.description = description
        self.capacite_max = capacite_max
    }
}
