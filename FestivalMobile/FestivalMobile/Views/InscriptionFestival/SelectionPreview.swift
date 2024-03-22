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
            choixTab = viewModel.choixPostes.map({ choixPoste in
                    return choixPoste.data
                })
        case .Animation:
            choixTab = viewModel.choixAnimations.map({ choixAnimation in
                return choixAnimation.data
            })
        }

        return ForEach(choixTab, id: \.self.id){ choix in
            Text(choix.name)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        
    }
}
