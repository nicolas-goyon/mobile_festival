//
//  SearchBarView.swift
//  FestivalMobile
//
//  Created by etud on 13/03/2024.
//

import Foundation
import SwiftUI


struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
