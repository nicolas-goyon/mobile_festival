//
//  MultiSelectList.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI

struct MultiSelectList<T: ListItemProtocol>: View {
    @ObservedObject var viewModel: MultiSelectListVM<T>
    @Binding var selectedItems: [MultiSelectObjectVM<T>]
    var showSearchBar: Bool = false
    
    var body: some View {
            Form {
                if showSearchBar {
                    SearchBarView(searchText: $viewModel.searchText)
                }
                List {
                    ForEach(viewModel.filteredResults) { item in
                        ListRowView(item: item, isSelected: .constant(selectedItems.contains(where: { $0.id == item.id })))
                            .onTapGesture {
                                if let index = selectedItems.firstIndex(where: { $0.id == item.id }) {
                                    selectedItems.remove(at: index)
                                } else {
                                    selectedItems.append(item)
                                }
                                viewModel.selectItem(item: item)
                                
                            }
                    }
                }
            }
        }
}
