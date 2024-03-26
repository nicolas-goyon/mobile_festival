//
//  ContentView.swift
//  FestivalMobile
//
//  Created by etud on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var festival : Festival = Festival(
        id: 1,
        nom: "Festival 2024",
        adresse: "Corum",
        description: "Un bon festival",
        dates: [
            Date(timeIntervalSince1970: 1711062000), // 22/03/2024
            Date(timeIntervalSince1970: 1711148400) // 23/03/2024
        ],
        creneaux: [
            Creneau(
                _id: 1,
                dateHeureDebut: Date(timeIntervalSince1970: 1711090800), // 22/03/2024 8:00
                dateHeureFin: Date(timeIntervalSince1970: 1711098000), // 22/03/2024 10:00
                postes: [
                    Poste(
                        id: 1,
                        nom: "Poste 1",
                        description: "Description 1",
                        capacite_max: 10
                    ),
                    Poste(
                        id: 2,
                        nom: "Poste 2",
                        description: "Description 2",
                        capacite_max: 10
                    )
                ],
                animations: [
                    Animation(
                        id: 1,
                        nom: "Animation 1",
                        description: "Description 1",
                        capacite_max: 10,
                        jeux_id: [1]
                    ),
                    Animation(
                        id: 2,
                        nom: "Animation 2",
                        description: "Description 2",
                        capacite_max: 10,
                        jeux_id: [1, 2]
                    )
                ]
                
            ),
        ],
        jeux: [
            Jeu(
                id: 1,
                nom: "Jeu 1",
                type: "Type 1",
                joueurs_min: 2,
                joueurs_max: 4,
                age_min: 8,
                duree: 30,
                notice: "Notice 1",
                a_animer: false,
                recu: false,
                mechanismes: "Mécanique 1",
                themes: "Thème 1",
                tags: "Tag 1",
                description: "Description 1",
                image: "Image 1",
                logo: "Logo 1",
                video: "Video 1",
                auteur: "Auteur 1",
                editeur: "Editeur 1"
            ),
            Jeu(
                id: 2,
                nom: "Jeu 2",
                type: "Type 2",
                joueurs_min: 2,
                joueurs_max: 4,
                age_min: 8,
                duree: 30,
                notice: "Notice 2",
                a_animer: false,
                recu: false,
                mechanismes: "Mécanique 2",
                themes: "Thème 2",
                tags: "Tag 2",
                description: "Description 2",
                image: "Image 2",
                logo: "Logo 2",
                video: "Video 2",
                auteur: "Auteur 2",
                editeur: "Editeur 2"
            )
        ])
    
    
    
    
    
    
    var body: some View {
//        NavigationBarView()
        InscriptionListeCreneaux(viewModel: InscriptionCreneauxVM(festival: festival))
//        RechercheJeux()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
