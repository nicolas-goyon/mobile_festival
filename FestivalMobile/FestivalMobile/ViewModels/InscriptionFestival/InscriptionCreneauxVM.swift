//
//  InscriptionCreneauVM.swift
//  FestivalMobile
//
//  Created by etud on 15/03/2024.
//

import Foundation

struct InscriptionCreneauxVM{
    var creneaux : [CreneauChoixVM]
    var journees : [Date]
    
    init(creneaux: [CreneauChoixVM]){
        self.creneaux = creneaux
        self.journees = creneaux.map{ creneau in
            return creneau.dateHeureDebut
        }
    }
    
    init(festival: Festival){
        self.creneaux = festival.creneaux.map{ creneau in
            return CreneauChoixVM(creneau: creneau)
        }
        self.journees = festival.dates
    }
    
    func getCreneauxByDate(journee: Date) -> [CreneauChoixVM]{
        // dd - mm - yyyy doivent matcher
        let creneaux = self.creneaux.filter{ creneau in
            return Calendar.current.isDate(creneau.dateHeureDebut, inSameDayAs: journee)
        }
        // sort by hours (ascending)
        return creneaux.sorted{ $0.dateHeureDebut < $1.dateHeureDebut }
    }
}
