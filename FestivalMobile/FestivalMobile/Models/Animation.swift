//
//  Animation.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation


class Animation {
    
    public private(set) var _id :           String
    public private(set) var nom :           String
    public private(set) var description :   String?
    public private(set) var capacite_max :  Int
    public var jeux_id :          [String]
    
    init(id : String, nom : String, description : String, capacite_max : Int, jeux_id : [String]){
        self._id = id
        self.nom = nom
        self.description = description
        self.capacite_max = capacite_max
        self.jeux_id = jeux_id
    }
    
    init(dto: ZoneDTO){
        self._id = dto.id
        self.nom = dto.name
        self.description = dto.description
        self.capacite_max = dto.max_capacity
        self.jeux_id = []
    }
}
