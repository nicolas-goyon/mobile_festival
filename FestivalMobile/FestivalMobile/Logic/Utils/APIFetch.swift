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
    
    static func getDTOWithToken<T : Codable>(urlEndpoint: String, codableClass: T.Type, token : String) async throws -> T {
        let token = token
        let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+urlEndpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let result = try decoder.decode(codableClass, from: data)
        return result
    }
}
