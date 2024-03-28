//
//  ConnexionToken.swift
//  FestivalMobile
//
//  Created by etud on 28/03/2024.
//

import Foundation

class ConnexionToken : ObservableObject {
    public private(set) static var tokenInstance : ConnexionToken = ConnexionToken()
    
    @Published var token : String?
    
    private init(){
        self.token = nil
    }
}
