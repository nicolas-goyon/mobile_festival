//
//  SelectionPosteVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
class SelectionAnimationVM: ListItemProtocol{
    let id = UUID()
    public private(set) var animation : Animation
    public var name: String { return animation.nom }
    
    
    init(animation: Animation){
        self.animation = animation
    }
}
