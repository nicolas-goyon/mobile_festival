//
//  Attributions.swift
//  FestivalMobile
//
//  Created by etud on 27/03/2024.
//

import Foundation
import SwiftUI

struct AttributionsView: View {
    let volunteerActivities = [
        AttributionVM(startTime: Date(timeIntervalSinceNow: 0), endTime: Date(timeIntervalSinceNow: 2*60*60), name: "Entrance", description: "Greet guests and check them in"),
        AttributionVM(startTime: Date(timeIntervalSinceNow: 2*60*60), endTime: Date(timeIntervalSinceNow: 4*60*60), name: "Kitchen", description: "Prepare food and assist the chef"),
        AttributionVM(startTime: Date(timeIntervalSinceNow: 4*60*60), endTime: Date(timeIntervalSinceNow: 6*60*60), name: "Cleaning", description: "Clean up the event space and put away supplies")
    ]
    
    
    let jeux : [String] = ["Jeu1", "Jeu2", "Jeu3"]

    
    var body: some View{
        NavigationStack{
            Text("Volunteer Activities")
                .font(.title)
            List(volunteerActivities) { activity in
                NavigationLink(destination: AttributionDetail(viewModel: AttributionDetailVM(poste: activity.name, dateHeureDebut: activity.startTime, dateHeureFin: activity.endTime, description: activity.description, jeux: jeux))){
                    VStack(alignment: .leading) {
                        Text("\(activity.startTime.formatted(date: .omitted, time: .shortened)) - \(activity.endTime.formatted(date: .omitted, time: .shortened))")
                            .font(.headline)
                        Text(activity.name)
                            .font(.title)
                        Text(activity.description)
                            .font(.body)
                    }
                }
                
            }
            Button("Modifier les choix") {
                print("Modifier les choix")
            }
        }
    }
}
