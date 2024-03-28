//
//  GameDTO.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation

struct GameDTO: Codable {
    let id: String
    let name: String
    let type: String?
    let minPlayers: Int?
    let maxPlayers: Int?
    let minAge: Int?
    let duration: Int?
    let notice: String?
    let toAnimate: Bool
    let received: Bool
    let mechanisms: String?
    let themes: String?
    let tags: String?
    let description: String?
    let image: String?
    let logo: String?
    let video: String?
    let author: String?
    let editor: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type
        case minPlayers = "minPlayers"
        case maxPlayers = "maxPlayers"
        case minAge = "age_min"
        case duration = "duree"
        case notice
        case toAnimate = "toAnimate"
        case received = "recieved"
        case mechanisms = "mechanisms"
        case themes
        case tags
        case description
        case image
        case logo
        case video
        case author = "author"
        case editor = "editor"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        minPlayers = try container.decodeIfPresent(Int.self, forKey: .minPlayers)
        maxPlayers = try container.decodeIfPresent(Int.self, forKey: .maxPlayers)
        minAge = try container.decodeIfPresent(Int.self, forKey: .minAge)
        duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        notice = try container.decodeIfPresent(String.self, forKey: .notice)
        toAnimate = try container.decode(Bool.self, forKey: .toAnimate)
        received = try container.decode(Bool.self, forKey: .received)
        mechanisms = try container.decodeIfPresent(String.self, forKey: .mechanisms)
        themes = try container.decodeIfPresent(String.self, forKey: .themes)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        logo = try container.decodeIfPresent(String.self, forKey: .logo)
        video = try container.decodeIfPresent(String.self, forKey: .video)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        editor = try container.decode(String.self, forKey: .editor)
    }
    
}
