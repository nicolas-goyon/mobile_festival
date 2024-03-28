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
    
    func inscription(){
        debugPrint("Inscription")
        for creneau in self.creneaux{
            if (creneau.typeChoix != TypeChoix.SansChoix){
                debugPrint("===> Inscription à \(formatHeures(creneau.dateHeureDebut)) - \(formatHeures(creneau.dateHeureFin))")
                let selection : [any ListItemProtocol] = (creneau.typeChoix == TypeChoix.Animation) ? creneau.animationSelectList.selectedData.map{$0.data} : creneau.posteSelectList.selectedData.map{$0.data}
                for item in selection{
                    let id = ConnexionToken.tokenInstance.id!
                    debugPrint("===> { zoneId: \(item.id), volunteerId: \(id), slotId: \(creneau.idCreneau) }")
                }
            }
        }
    }
    
    
    
    
    func formatHeures(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
