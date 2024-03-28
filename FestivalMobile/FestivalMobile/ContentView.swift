//
//  ContentView.swift
//  FestivalMobile
//
//  Created by etud on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var festivals: ObservableArray<Festival>
    @EnvironmentObject var currentFestival: OptionnalFestival
    
    let volunteerVM = VolunteerVM()
    
    
    var body: some View {
        NavigationStack{
            NavigationBarView(viewModel: volunteerVM)
            //        if currentFestival.festival == nil {
            //            return AnyView(Text("Chargement..."))
            //        }else{
            //            return AnyView(NavigationView{
            //                InscriptionListeCreneaux(viewModel: InscriptionCreneauxVM(festival: currentFestival.festival!))
            //            })
            //        }
            //ProfileView(viewModel: volunteerVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
