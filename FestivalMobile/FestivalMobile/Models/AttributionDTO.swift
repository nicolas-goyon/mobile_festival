//
//  AttributionDTO.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation

class AttributionDTO: Codable{
    let id_benevole : String
    let id_zone : String
    let est_referent: Bool
    let id_creneau : String
    
    init(id_benevole: String, id_zone: String, est_referent: Bool, id_creneau: String){
        self.id_benevole = id_benevole
        self.id_zone = id_zone
        self.est_referent = est_referent
        self.id_creneau = id_creneau
    }
}
