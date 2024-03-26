//
//  File.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 22/03/2024.
//

import Foundation

struct VolunteerDTO : Codable {
    
    let firstname : String
    let lastname : String
    let email : String
    let password : String
    let nb_edition_performed : Int
    let tshirt_size : String
    let lodging : String
    let food_regime : String
    let address : String?
    let phone : String?
    let username : String?
    let avatar_url : String?
    let associations: [String]?
    
    init(firstname: String, lastname: String, email: String, password: String, nbEditionPerformed: Int, tshirtSize: TshirtSizeEnum, lodging: LodgingEnum, foodRegime: FoodRegimeEnum, address: String? = nil, phone: String? = nil, username: String? = nil, avatarUrl: String? = nil, associations: [String]? = nil) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.nb_edition_performed = nbEditionPerformed
        self.tshirt_size = tshirtSize.rawValue
        self.lodging = lodging.rawValue
        self.food_regime = foodRegime.rawValue
        self.address = address
        self.phone = phone
        self.username = username
        self.avatar_url = avatarUrl
        self.associations = associations
    }
}

enum TshirtSizeEnum : String, Codable, CaseIterable, Identifiable {
    var id : Self { self }
    
    case XXS = "XXS"
    case XS = "XS"
    case S = "S"
    case M = "M"
    case L = "L"
    case XL = "XL"
    case XXL = "XXL"
    case XXXL = "XXXL"
}

enum LodgingEnum : String, Codable, CaseIterable, Identifiable {
    var id : Self { self }
    
    case propisition = "propisition"
    case recherche = "recherche"
    case aucun = "aucun"
}

enum FoodRegimeEnum : String, Codable, CaseIterable, Identifiable {
    var id : Self { self }
    
    case vegetarien = "vegetarien"
    case carnivore = "carnivore"
    case autre = "autre"
}