//
//  MultiSelectListVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation

class MultiSelectListVM<T : ListItemProtocol>: ObservableObject{
    @Published var listData : [MultiSelectObjectVM<T>] = []
    @Published var selectedData : [MultiSelectObjectVM<T>] = []
    @Published var searchText : String = "" {
        didSet {
            filterData()
        }
    }
    @Published var filteredResults: [MultiSelectObjectVM<T>] = []
    
    init(data: [T]){
        self.listData = data.map{MultiSelectObjectVM(data: $0)}
        self.filteredResults = listData
    }
    
    func filterData(){
        if searchText.isEmpty {
            filteredResults = listData
        } else {
            filteredResults = listData.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func selectItem(item: MultiSelectObjectVM<T>){
        item.toogleSelection()
        if item.estSelectionne {
            selectedData.append(item)
        } else {
            selectedData.removeAll(where: {$0.id == item.id})
        }
    }
    
    
}
