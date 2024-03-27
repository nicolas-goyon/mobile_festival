//
//  FestivalVM.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import Foundation

class FestivalVM: ObservableObject {
    
    // Récupère le festival en cours / celui qui arrive
    func fetchFestival() async {
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"festivals/current") else {
           debugPrint("Bad URL when trying to get the current festival")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async{
                    if let error = error {
                        debugPrint("Error : ", error)
                    }
                    guard let data = data else {
                        debugPrint("Error : Data currentFestival")
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedData = try decoder.decode(FestivalDTO.self, from: data)
                        debugPrint("Response current festival :", decodedData)
                    }
                    catch {
                        debugPrint("Error decoding JSON", error)
                    }
                }
                
            }.resume()
        }
    }
    
    // Récupère tous les festivals
    func fetchAllFestival() async {
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"festivals") else {
           debugPrint("Bad URL when trying to get all festivals")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async{
                    if let error = error {
                        debugPrint("Error : ", error)
                    }
                    guard let data = data else {
                        debugPrint("Error : Data all Festivals")
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedData = try decoder.decode([FestivalDTO].self, from: data)
                        debugPrint("Response all festivals :", decodedData)
                    } catch {
                        debugPrint("Error decoding JSON:", error)
                    }
                }
                
            }.resume()
        }
    }

}
