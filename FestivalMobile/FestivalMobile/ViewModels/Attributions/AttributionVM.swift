//
//  AttributionVM.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation

class AttributionVM: ObservableObject, Identifiable {
    let id = UUID()
    let startTime: Date
    let endTime: Date
    let name: String
    let description: String
    
    init(startTime: Date, endTime: Date, name: String, description: String) {
        self.startTime = startTime
        self.endTime = endTime
        self.name = name
        self.description = description
    }
}
