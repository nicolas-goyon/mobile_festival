//
//  File.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 22/03/2024.
//

import Foundation

struct VolunteerDTO : Codable {
    
    var id : String = UUID().uuidString
    let firstname : String
    let lastname : String
    let email : String
    let password : String?
    let nbEditionPerformed : Int
    let tshirtSize : String
    let lodging : String
    let foodRegime : String
    let address : String?
    let phone : String?
    let username : String?
    let avatarUrl : String?
    let isAdmin: Bool?
    let associations: [String]?
    
    init(firstname: String, lastname: String, email: String, password: String?, nbEditionPerformed: Int, tshirtSize: TshirtSizeEnum, lodging: LodgingEnum, foodRegime: FoodRegimeEnum, address: String? = nil, phone: String? = nil, username: String? = nil, avatarUrl: String? = nil, is_admin: Bool? = nil ,associations: [String]? = nil) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.nbEditionPerformed = nbEditionPerformed
        self.tshirtSize = tshirtSize.rawValue
        self.lodging = lodging.rawValue
        self.foodRegime = foodRegime.rawValue
        self.address = address
        self.phone = phone
        self.username = username
        self.avatarUrl = avatarUrl
        self.isAdmin = is_admin
        self.associations = associations
    }
    /*
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case email
        case password
        case nbEditionPerformed = "nb_edition_performed"
        case tshirtSize = "tshirt_size"
        case lodging
        case foodRegime = "food_regime"
        case address
        case phone
        case username
        case avatarUrl = "avatar_url"
        case isAdmin = "is_admin"
        case associations
    }
     */
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
