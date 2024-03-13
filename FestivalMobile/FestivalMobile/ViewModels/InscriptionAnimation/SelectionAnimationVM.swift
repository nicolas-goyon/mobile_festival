//
//  SelectionPosteVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
class SelectionAnimationVM: ListItemProtocol{
    let id = UUID()
    public private(set) var animation : String
    public var name: String { return animation }
    
    init(animation: String){
        self.animation = animation
    }
}
