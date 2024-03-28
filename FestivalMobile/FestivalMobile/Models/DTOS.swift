//
//  ZoneDTO.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation


struct ZoneDTO: Codable {
    var id : String
    var name : String
    var description : String?
    var max_capacity : Int
    var animation : Bool
    var festival_id: String
    var created_at: Date
    var updated_at: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.max_capacity = try container.decode(Int.self, forKey: .max_capacity)
        self.animation = try container.decode(Bool.self, forKey: .animation)
        self.festival_id = try container.decode(String.self, forKey: .festival_id)
        // date comming from 2024-02-09T06:45:03.556+00:00
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let created_at = try container.decode(String.self, forKey: .created_at)
        self.created_at = dateFormatter.date(from: created_at)!
        let updated_at = try container.decode(String.self, forKey: .updated_at)
        self.updated_at = dateFormatter.date(from: updated_at)!
    }
}

struct GameZoneDTO: Codable{
    var gameId: String
    var zoneId: String
}


struct CreneauDTO: Codable {
    var id: String
    var startTime: Date
    var endTime: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let start_time = try container.decode(String.self, forKey: .startTime)
        self.startTime = dateFormatter.date(from: start_time)!
        let end_time = try container.decode(String.self, forKey: .endTime)
        self.endTime = dateFormatter.date(from: end_time)!
    }
}
