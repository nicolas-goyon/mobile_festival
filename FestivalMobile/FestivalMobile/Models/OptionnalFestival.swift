//
//  OptionnalFestival.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation

class OptionnalFestival: ObservableObject{
    
    @Published var festival: Festival?
    
    init(){
        self.festival = nil
    }
    
    func setFestival(festival: Festival){
        self.festival = festival
        self.objectWillChange.send()
    }
}
