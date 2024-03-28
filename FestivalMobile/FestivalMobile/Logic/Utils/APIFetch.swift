//
//  APIFetch.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation

struct APIFetch {
    
    static func getDTO<T: Codable>(urlEndpoint: String, codableClass: T.Type) async throws -> T {
        let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+urlEndpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(codableClass, from: data)
        return result
    }
}
