//
//  CreneauChoixVM.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation
import Combine

class CreneauChoixVM : ObservableObject, Hashable, Equatable, Subscriber {
    func receive(_ input: ()) -> Subscribers.Demand {
        debugPrint("CreneauChoixVM receive")
        objectWillChange.send()
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        objectWillChange.send()
    }
    
    
    typealias Input = ()
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
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
    private var _typeChoix : TypeChoix = .SansChoix
    var typeChoix : TypeChoix {
        get {
            return _typeChoix
        }
        set {
            _typeChoix = newValue
            objectWillChange.send()
        }
    }
    
    var posteSelectList : MultiSelectListVM<SelectionPosteVM>
    var animationSelectList : MultiSelectListVM<SelectionAnimationVM>
    
    init(idCreneau: Int, dateDebut: Date, dateFin: Date, postes: [SelectionPosteVM], animations: [SelectionAnimationVM]){
        self.idCreneau = idCreneau
        self.dateHeureDebut = dateDebut
        self.dateHeureFin = dateFin
        self.postes = postes
        self.animations = animations
        self.posteSelectList = MultiSelectListVM(data: postes)
        self.animationSelectList = MultiSelectListVM(data: animations)
        
        self.posteSelectList.objectWillChange.receive(subscriber: self)
        self.animationSelectList.objectWillChange.receive(subscriber: self)
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
        
        self.posteSelectList = MultiSelectListVM(data: postes)
        self.animationSelectList = MultiSelectListVM(data: animations)
        
        self.posteSelectList.objectWillChange.receive(subscriber: self)
        self.animationSelectList.objectWillChange.receive(subscriber: self)
    }
    
    
    
    
}
