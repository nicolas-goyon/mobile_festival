//
//  Creneau.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation


class Creneau {
    
    public private(set) var _id : Int
    public private(set) var dateHeureDebut : Date
    public private(set) var dateHeureFin : Date
    public private(set) var postes : [Poste]
    public private(set) var animations : [Animation]
    
    init(_id: Int, dateHeureDebut: Date, dateHeureFin: Date, postes: [Poste], animations: [Animation]) {
        self._id = _id
        self.dateHeureDebut = dateHeureDebut
        self.dateHeureFin = dateHeureFin
        self.postes = postes
        self.animations = animations
    }
}
