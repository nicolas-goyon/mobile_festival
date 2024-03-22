//
//  MultiSelectListVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

class MultiSelectObjectVM<T : ListItemProtocol>: Identifiable, Hashable{
    static func == (lhs: MultiSelectObjectVM<T>, rhs: MultiSelectObjectVM<T>) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()
    public private(set) var name : String
    public var estSelectionne: Bool
    let data : T
    
    init(data: T){
        self.name = data.name
        self.estSelectionne = false
        self.data = data
    }
    
    
    func toogleSelection(){
        estSelectionne = !estSelectionne
    }
    
}
