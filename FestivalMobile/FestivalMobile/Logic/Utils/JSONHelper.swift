//
//  JSONHelper.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import Foundation


class JSONHelper {
    static func encode<T: Encodable>(data: T) async -> Data?
    {
        let encoder = JSONEncoder()
        return try? encoder.encode(data)
    }
    
    static func decode<T: Decodable>(data: Data) async -> T?{
       let decoder = JSONDecoder()
       guard let decoded = try? decoder.decode(T.self, from: data) else {
          return nil
       }
       return decoded
    }
}
