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
    var showSearchBar: Bool = false
    
    var body: some View {
            Form {
                if showSearchBar {
                    SearchBarView(searchText: $viewModel.searchText)
                }
                List {
                    ForEach(viewModel.filteredResults) { item in
                        ListRowView(item: item, isSelected: .constant(viewModel.selectedData.contains(where: { $0.id == item.id })))
                            .onTapGesture {
                                if let index = viewModel.selectedData.firstIndex(where: { $0.id == item.id }) {
                                    viewModel.selectedData.remove(at: index)
                                } else {
                                    viewModel.selectedData.append(item)
                                }
                                viewModel.selectItem(item: item)
                                
                            }
                    }
                }
            }
        }
}
