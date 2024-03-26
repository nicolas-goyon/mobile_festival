//
//  ObservableArray.swift
//  FestivalMobile
//
//  Created by etud on 26/03/2024.
//

import Foundation
import Combine

class ObservableArray<T : Equatable>: ObservableObject, RandomAccessCollection {
    @Published var array: [T] = []
    
    init(array: [T]) {
        self.array = array
    }
    
    func append(_ newElement: T) {
        if !array.contains(newElement) {
            array.append(newElement)
            objectWillChange.send()
        }
    }
    
    func remove(at index: Int) {
        array.remove(at: index)
        objectWillChange.send()
    }
    
    func remove(at indexSet: IndexSet) {
        array.remove(atOffsets: indexSet)
        objectWillChange.send()
    }
    
    func removeAll() {
        array.removeAll()
        objectWillChange.send()
    }
    
    func removeAll(where predicate: (T) -> Bool) {
        array.removeAll(where: predicate)
        objectWillChange.send()
    }
    
    func filter(_ isIncluded: (T) -> Bool) -> [T] {
        return array.filter(isIncluded)
    }
    
    func map<U>(_ transform: (T) -> U) -> [U] {
        return array.map(transform)
    }
    
    func forEach(_ body: (T) -> Void) {
        array.forEach(body)
    }
    
    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        objectWillChange.send()
        array.move(fromOffsets: source, toOffset: destination)
    }
    
    func contains(where predicate: (T) -> Bool) -> Bool {
        return array.contains(where: predicate)
    }
    
    func first(where predicate: (T) -> Bool) -> T? {
        return array.first(where: predicate)
    }
    
    func firstIndex(where predicate: (T) -> Bool) -> Int? {
        return array.firstIndex(where: predicate)
    }
    
    func last(where predicate: (T) -> Bool) -> T? {
        return array.last(where: predicate)
    }
    
    func lastIndex(where predicate: (T) -> Bool) -> Int? {
        return array.lastIndex(where: predicate)
    }
    
    func sorted(by areInIncreasingOrder: (T, T) -> Bool) -> [T] {
        return array.sorted(by: areInIncreasingOrder)
    }
    
    var startIndex: Int { array.startIndex }
    
    var endIndex: Int { array.endIndex }
    
    subscript(position: Int) -> T {
        return array[position]
    }
    
    func index(after i: Int) -> Int {
        return array.index(after: i)
    }
    
    func index(before i: Int) -> Int {
        return array.index(before: i)
    }
    
    func makeIterator() -> IndexingIterator<[T]> {
        return array.makeIterator()
    }
    
    func enumerated() -> EnumeratedSequence<[T]> {
        return array.enumerated()
    }
    
   
}
