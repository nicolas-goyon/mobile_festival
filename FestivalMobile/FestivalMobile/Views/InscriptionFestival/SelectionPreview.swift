//
//  SelectionPreview.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation
import SwiftUI


struct SelectionPreview : View {
    @ObservedObject var viewModel : CreneauChoixVM
    
    
    var body: some View {
        var choixTab : [any ListItemProtocol] = []
        switch viewModel.typeChoix {
        case .Poste:
            choixTab = viewModel.posteSelectList.selectedData.array.map({ choixPoste in
                    return choixPoste.data
                })
        case .Animation:
            choixTab = viewModel.animationSelectList.selectedData.array.map({ choixAnimation in
                return choixAnimation.data
            })
        case .SansChoix:
            choixTab = []
        }
        
        var text = choixTab.map({ $0.name }).joined(separator: ", ")
        let maxSize = 20
        if text.count > maxSize {
            let index = text.index(text.startIndex, offsetBy: maxSize)
            text = String(text[..<index])
            text = text + "..."
        }
        
        return Text(text)
            .font(.footnote)
            .foregroundColor(.gray)
        
        
    }
}
