//
//  InscriptionCreneauVM.swift
//  FestivalMobile
//
//  Created by etud on 15/03/2024.
//

import Foundation

struct InscriptionCreneauxVM{
    var creneaux : [CreneauChoixVM]
    
    init(creneaux: [CreneauChoixVM]){
        self.creneaux = creneaux
    }
    
    init(festival: Festival){
        self.creneaux = festival.creneaux.map{ creneau in
            return CreneauChoixVM(creneau: creneau)
        }
    }
}
