//
//  FestivalMobileApp.swift
//  FestivalMobile
//
//  Created by etud on 26/02/2024.
//

import SwiftUI

@main
struct FestivalMobileApp: App {
    @StateObject var festivals: ObservableArray<Festival> = ObservableArray<Festival>(array: [])
    @StateObject var currentFestival: OptionnalFestival = OptionnalFestival()
    @StateObject var token: ConnexionToken = ConnexionToken.tokenInstance
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onAppear(perform: {
                Task {
                    do {
                        let festivalDTO = try await APIFetch.getDTO(urlEndpoint: "festivals", codableClass: [FestivalArrayElementDTO].self)
                        for festival in festivalDTO {
                            festivals.append(Festival(festivalArrayElementDTO: festival))
                        }
                        
                        
                        let festival = try await FestivalDTO.getFullCurrentFestival()
                        currentFestival.setFestival(festival: festival)
                    } catch {
                        print("Error : \(error)")
                    }
                }
            })
            .environmentObject(festivals)
            .environmentObject(currentFestival)
        }
    }
}
