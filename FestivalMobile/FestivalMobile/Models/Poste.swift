//
//  Poste.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class Poste {
        
    public private(set) var _id :           String
    public private(set) var nom :           String
    public private(set) var description :   String?
    public private(set) var capacite_max :  Int
    
    init(id : String, nom : String, description : String, capacite_max : Int){
        self._id = id
        self.nom = nom
        self.description = description
        self.capacite_max = capacite_max
    }
    
    init(dto: ZoneDTO){
        self._id = dto.id
        self.nom = dto.name
        self.description = dto.description
        self.capacite_max = dto.max_capacity
    }
}
