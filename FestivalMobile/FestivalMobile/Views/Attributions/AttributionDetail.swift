//
//  AttributionDetail.swift
//  TPS
//
//  Created by etud on 26/03/2024.
//

import Foundation
import SwiftUI


struct AttributionDetail: View{
    
    @ObservedObject var viewModel : AttributionDetailVM
    
    var body: some View{
        Form(content: {
            
            Section(header: Text("Attribution au poste : ").bold()){
                Text(viewModel.poste)
            }
            
            Section(header: Text("Date : ").bold()){
                Text(formatDateJournee(date: viewModel.dateHeureDebut))
            }
            
            Section(header: Text("Heure de début : ").bold()){
                Text(formatDateHorraire(date: viewModel.dateHeureDebut))
            }
            
            Section(header: Text("Heure de fin : ").bold()){
                Text(formatDateHorraire(date: viewModel.dateHeureFin))
            }
            
            Section(header: Text("Description : ").bold()){
                Text(viewModel.description)
            }
            
            Section(header: Text("Jeux : ").bold()){
                List(viewModel.jeux, id: \.self){ jeu in
                    Text(jeu)
                }
            }
            
            
        })
    }
    
    func formatDateHorraire(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func formatDateJournee(date: Date) -> String{
        let formatter = DateFormatter()
        // format : mardi 26 mars
        formatter.dateFormat = "EEEE d MMMM"
        return formatter.string(from: date)
    }
}
