//
//  WishDTO.swift
//  FestivalMobile
//
//  Created by etud on 28/03/2024.
//

import Foundation

class WishDTO : Codable {
    var volunteer_id: String
    var zone_id: String
    var slot_id: String
    
    init( volunteer_id: String, zone_id: String, slot_id: String){
        self.volunteer_id = volunteer_id
        self.zone_id = zone_id
        self.slot_id = slot_id
    }
}
