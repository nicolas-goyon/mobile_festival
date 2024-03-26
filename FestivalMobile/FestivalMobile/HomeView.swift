//
//  SwiftUIView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Home").font(.title)
                Image("LogoFJM_couleur").resizable().scaledToFit()
                Text("Connect yourself to know more about it")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
