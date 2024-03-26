//
//  ListItemProtocol.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

protocol ListItemProtocol : Identifiable {
    var name : String {get}
    var id : UUID {get}
}
