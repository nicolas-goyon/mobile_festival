//
//  FestivalDTO.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import Foundation

struct FestivalDTO : Codable {
    
    var id: String = UUID().uuidString
    let title: String
    let startDate: String
    let endDate: String
    let address: String
    let description: String
    let posterPath: String
    let created_at: String?
    let updated_at: String?
    
}

struct FestivalsDTO : Codable {
    let festivals : [FestivalDTO]
}
