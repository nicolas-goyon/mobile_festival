//
//  Animation.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation


class Animation {
    
    public private(set) var _id :           Int
    public private(set) var nom :           String
    public private(set) var description :   String
    public private(set) var capacite_max :  Int
    public private(set) var jeux_id :          [Int]
    
    init(id : Int, nom : String, description : String, capacite_max : Int, jeux_id : [Int]){
        self._id = id
        self.nom = nom
        self.description = description
        self.capacite_max = capacite_max
        self.jeux_id = jeux_id
    }
}
