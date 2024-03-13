//
//  SelectionPoste.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI

struct SelectionAnimation : View {
    
    
    
    @ObservedObject var animation : MultiSelectListVM<SelectionAnimationVM>
    
    @Binding var selectedItems: [MultiSelectObjectVM<SelectionAnimationVM>]
    
    
    var body: some View{
        MultiSelectList(viewModel: animation, selectedItems: $selectedItems, showSearchBar: true)
    }
}
