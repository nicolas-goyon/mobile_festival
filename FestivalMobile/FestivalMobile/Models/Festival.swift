//
//  FestivalModel.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class Festival {
    
    public private(set) var _id :           Int
    public private(set) var nom :           String
    public private(set) var adresse :       String
    public private(set) var description :   String
    public private(set) var dates :         [Date]
    public private(set) var creneaux :      [Creneau]
    public private(set) var jeux :          [Jeu]
    
    init(id : Int, nom : String, adresse : String, description : String, dates : [Date], creneaux : [Creneau], jeux : [Jeu]){
        self._id = id
        self.nom = nom
        self.adresse = adresse
        self.description = description
        self.dates = dates
        self.creneaux = creneaux
        self.jeux = jeux
    }
}
