//
//  Tests.swift
//  FestivalMobile
//
//  Created by etud on 26/03/2024.
//

import Foundation
import SwiftUI

struct Tests: View{
    var body: some View{
        
        let testArray : ObservableArray<String> = ObservableArray<String>(array: ["test1", "test2", "test3"])
        
        return List {
            ForEach(testArray.array, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: { indexSet in
                testArray.remove(at: indexSet)
            })
            .onMove(perform: { indices, newOffset in
                testArray.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
    }
}
