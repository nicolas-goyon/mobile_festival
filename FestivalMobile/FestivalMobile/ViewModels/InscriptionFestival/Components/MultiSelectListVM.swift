//
//  MultiSelectListVM.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import Combine

class MultiSelectListVM<T : ListItemProtocol>: ObservableObject, Subscriber {
    func receive(_ input: ()) -> Subscribers.Demand {
        objectWillChange.send()
        return .none
        
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        objectWillChange.send()
    }
    
    typealias Input = ()
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    @Published var listData : [MultiSelectObjectVM<T>] = []
    @Published var selectedData : ObservableArray<MultiSelectObjectVM<T>> = ObservableArray<MultiSelectObjectVM<T>>(array:[])
    @Published var searchText : String = "" {
        didSet {
            filterData()
        }
    }
    @Published var filteredResults: [MultiSelectObjectVM<T>] = []
    
    init(data: [T]){
        self.listData = data.map{MultiSelectObjectVM(data: $0)}
        self.filteredResults = listData
        selectedData.objectWillChange.receive(subscriber: self)
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
