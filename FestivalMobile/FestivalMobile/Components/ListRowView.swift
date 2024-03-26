//
//  ListRowView.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI

// List row view
struct ListRowView<T: ListItemProtocol>: View {
    var item: MultiSelectObjectVM<T>
    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .padding()
        .contentShape(Rectangle())
    }
}

