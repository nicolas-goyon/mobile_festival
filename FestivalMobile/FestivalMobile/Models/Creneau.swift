//
//  Creneau.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation


class Creneau {
    
    public private(set) var _id : String
    public private(set) var dateHeureDebut : Date
    public private(set) var dateHeureFin : Date
    public var postes : [Poste]
    public var animations : [Animation]
    
    init(_id: String, dateHeureDebut: Date, dateHeureFin: Date, postes: [Poste], animations: [Animation]) {
        self._id = _id
        self.dateHeureDebut = dateHeureDebut
        self.dateHeureFin = dateHeureFin
        self.postes = postes
        self.animations = animations
    }
    
    init(dto : CreneauDTO){
        self._id = dto.id
        self.dateHeureDebut = dto.startTime
        self.dateHeureFin = dto.endTime
        self.postes = []
        self.animations = []
    }
}
