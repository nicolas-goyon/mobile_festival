//
//  CreneauChoixVM.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class CreneauChoixVM : ObservableObject, Hashable, Equatable{
    static func == (lhs: CreneauChoixVM, rhs: CreneauChoixVM) -> Bool {
        return lhs.idCreneau == rhs.idCreneau
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idCreneau)
    }
    
    var idCreneau : Int
    var dateHeureDebut : Date
    var dateHeureFin : Date
    var postes : [SelectionPosteVM]
    var animations : [SelectionAnimationVM]
    var choixPostes : [MultiSelectObjectVM<SelectionPosteVM>]
    var choixAnimations : [MultiSelectObjectVM<SelectionAnimationVM>]
    var typeChoix : TypeChoix
    
    init(idCreneau: Int, dateDebut: Date, dateFin: Date, postes: [SelectionPosteVM], animations: [SelectionAnimationVM]){
        self.idCreneau = idCreneau
        self.dateHeureDebut = dateDebut
        self.dateHeureFin = dateFin
        self.postes = postes
        self.animations = animations
        self.choixPostes = []
        self.choixAnimations = []
        self.typeChoix = .Poste
    }
    
    init(creneau: Creneau){
        self.idCreneau = creneau._id
        self.dateHeureDebut = creneau.dateHeureDebut
        self.dateHeureFin = creneau.dateHeureFin
        self.postes = creneau.postes.map({ post in
                return SelectionPosteVM(poste: post)
            })
        self.animations = creneau.animations.map({ anim in
            return SelectionAnimationVM(animation: anim)
        })
        self.choixPostes = []
        self.choixAnimations = []
        self.typeChoix = .Poste
    }
    
    
    
    func getAnimations() -> MultiSelectListVM<SelectionAnimationVM>{
        return MultiSelectListVM(data: self.animations)
    }
    
    func getPostes() -> MultiSelectListVM<SelectionPosteVM>{
        return MultiSelectListVM(data: self.postes)
    }
    
    
    
    
}
