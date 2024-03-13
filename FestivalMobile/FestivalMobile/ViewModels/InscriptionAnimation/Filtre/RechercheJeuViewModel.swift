//
//  RechercheJeuViewModel.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation



class RechercheJeuVM : ListItemProtocol{

    let id : UUID = UUID()
    public private(set) var jeu : String
    public var name: String { return jeu }
    
    init(jeu: String){
        self.jeu = jeu
    }
    
    
    
}
