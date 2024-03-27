//
//  AnswerDTO.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 22/03/2024.
//

import Foundation

struct AnswerDTO : Decodable {
    let message : String
    
    enum CodingKeys: CodingKey {
        case message
    }
}
