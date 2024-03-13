//
//  InscriptionPosteVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

class SelectionPosteVM: ListItemProtocol {
    
    let id = UUID()
    public private(set) var poste : String
    public var name: String { return poste }
    
    init(poste: String){
        self.poste = poste
    }
    
}
