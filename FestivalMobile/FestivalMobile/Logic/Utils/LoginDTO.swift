//
//  LoginDTO.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import Foundation

struct LoginDTO : Codable, CustomStringConvertible {
    let email : String
    let password : String
    var description: String {
        return "email: \(self.email) - password: \(self.password)"
    }
}
