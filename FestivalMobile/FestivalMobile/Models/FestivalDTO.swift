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
    
    

    
    
    
    
    static func getFullCurrentFestival() async throws -> Festival {
        
        debugPrint("==> Getting current festival")
        
        let festivalDTO = try await APIFetch.getDTO(urlEndpoint: "festivals/current", codableClass: FestivalDTO.self)
        debugPrint("==> Festival received: \(festivalDTO.title)")
        let festival = Festival(festivalDTO: festivalDTO)
        
        let zonesDTO = try await APIFetch.getDTO(urlEndpoint: "zones", codableClass: [ZoneDTO].self)
        
        debugPrint("==> Zones received: \(zonesDTO.count)")
        
        // filter zones for the current festival
        let zones = zonesDTO.filter({$0.festival_id == festival._id})
        
        debugPrint("==> Zones for current festival: \(zones.count)")
        
        // get all games
        let gamesDTO = try await APIFetch.getDTO(urlEndpoint: "games", codableClass: [GameDTO].self)
        
        debugPrint("==> Games received: \(gamesDTO.count)")
        
//        // get all game-zones associations
//        let gameZonesDTO = try await APIFetch.getDTO(urlEndpoint: "game-zones", codableClass: [GameZoneDTO].self)
//
//        debugPrint("==> GameZones received: \(gameZonesDTO.count)")
        
        let creneauxDTO = try await APIFetch.getDTO(urlEndpoint: "slots", codableClass: [CreneauDTO].self)
        
        debugPrint("==> Creneaux received: \(creneauxDTO.count)")
        
        let creneaux = creneauxDTO.map({Creneau(dto: $0)})
        
        // pour chaque creneau, ajouter les zones (si la zone.animation => creneau.animation sinon creneau.poste)
        for creneau in creneaux {
            for zone in zones {
                if zone.animation {
                    creneau.animations.append(Animation(dto:zone))
                }
                else {
                    creneau.postes.append(Poste(dto:zone))
                }
            }
        }
        
        // pour chaque gameZone, ajouter a l'animation correspondante l'id du jeu
//        for gameZone in gameZonesDTO {
//            for creneau in creneaux {
//                for animation in creneau.animations {
//                    if animation._id == gameZone.zoneId {
//                        animation.jeux_id.append(gameZone.gameId)
//                    }
//                }
//            }
//        }
        
        // ajouter au festival les creneaux
        festival.creneaux = creneaux
        
        // Ajouter les jeux
        for game in gamesDTO {
            festival.jeux.append(Jeu(dto: game))
        }
        
        return festival
    }
    
}


struct FestivalArrayElementDTO : Codable {
    
    var id: String = UUID().uuidString
    let title: String
    let start_date: String
    let end_date: String
    let address: String
    let description: String
    let poster_path: String
    let created_at: String?
    let updated_at: String?
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
//        self.start_date = try container.decode(String.self, forKey: .start_date)
//        self.end_date = try container.decode(String.self, forKey: .end_date)
        // date comming from 2024-02-09T06:45:03.556+00:00 but should be dd/mm/yyyy
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let startDate = try container.decode(String.self, forKey: .start_date)
        let endDate = try container.decode(String.self, forKey: .end_date)
        let startDateDate = dateFormatter.date(from: startDate)
        let endDateDate = dateFormatter.date(from: endDate)
        let startDateFormatter = DateFormatter()
        startDateFormatter.dateFormat = "dd/MM/yyyy"
        let startDateString = startDateFormatter.string(from: startDateDate!)
        let endDateString = startDateFormatter.string(from: endDateDate!)
        
        self.start_date = startDateString
        self.end_date = endDateString
        
        
        
        self.address = try container.decode(String.self, forKey: .address)
        self.description = try container.decode(String.self, forKey: .description)
        self.poster_path = try container.decode(String.self, forKey: .poster_path)
        self.created_at = try container.decodeIfPresent(String.self, forKey: .created_at)
        self.updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at)
    }
    
    
    
}

struct FestivalsDTO : Codable {
    let festivals : [FestivalDTO]
}
