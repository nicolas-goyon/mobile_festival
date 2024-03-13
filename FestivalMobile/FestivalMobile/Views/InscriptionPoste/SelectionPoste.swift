//
//  SelectionPoste.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI

struct SelectionPoste : View {
    
    @ObservedObject var postes : MultiSelectListVM<SelectionPosteVM>
    
    @Binding var selectedItems: [MultiSelectObjectVM<SelectionPosteVM>]
    
    
    var body: some View{
        MultiSelectList(viewModel: postes, selectedItems: $selectedItems, showSearchBar: true)
    }
}
