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
}

class CreneauChoixVM{
    var idCreneau : Int
    var dateHeureDebut : Date
    var dateHeureFin : Date
    var postes : [SelectionPosteVM]
    var animations : [SelectionAnimationVM]
    var choix : [any ListItemProtocol]
    var typeChoix : TypeChoix
    
    init(idCreneau: Int, dateDebut: Date, dateFin: Date, postes: [SelectionPosteVM], animations: [SelectionAnimationVM]){
        self.idCreneau = idCreneau
        self.dateHeureDebut = dateDebut
        self.dateHeureFin = dateFin
        self.postes = postes
        self.animations = animations
        self.choix = []
        self.typeChoix = .Poste
    }
    
    func setChoix(choix: [any ListItemProtocol]){
        self.choix = choix
    }
}

enum TypeChoix{
    case Poste
    case Animation
}
