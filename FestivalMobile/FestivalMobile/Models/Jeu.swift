//
//  Jeu.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class Jeu{
    
    public private(set) var _id :           String
    public private(set) var nom :           String
    public private(set) var type :          String?
    public private(set) var joueurs_min :   Int?
    public private(set) var joueurs_max :   Int?
    public private(set) var age_min :       Int?
    public private(set) var duree :         Int?
    public private(set) var notice :        String?
    public private(set) var a_animer :      Bool
    public private(set) var recu :          Bool
    public private(set) var mechanismes :   String?
    public private(set) var themes :        String?
    public private(set) var tags :          String?
    public private(set) var description :   String?
    public private(set) var image :         String?
    public private(set) var logo :          String?
    public private(set) var video :         String?
    public private(set) var auteur :        String?
    public private(set) var editeur :       String
    
    
    init(id : String, nom : String, type : String?, joueurs_min : Int?, joueurs_max : Int?, age_min : Int?, duree : Int?, notice : String?, a_animer : Bool, recu : Bool, mechanismes : String?, themes : String?, tags : String?, description : String?, image : String?, logo : String?, video : String?, auteur : String?, editeur : String){
        self._id = id
        self.nom = nom
        self.type = type
        self.joueurs_min = joueurs_min
        self.joueurs_max = joueurs_max
        self.age_min = age_min
        self.duree = duree
        self.notice = notice
        self.a_animer = a_animer
        self.recu = recu
        self.mechanismes = mechanismes
        self.themes = themes
        self.tags = tags
        self.description = description
        self.image = image
        self.logo = logo
        self.video = video
        self.auteur = auteur
        self.editeur = editeur
    }
    
    init(dto: GameDTO){
        self._id = dto.id
        self.nom = dto.name
        self.type = dto.type
        self.joueurs_min = dto.minPlayers
        self.joueurs_max = dto.maxPlayers
        self.age_min = dto.minAge
        self.duree = dto.duration
        self.notice = dto.notice
        self.a_animer = dto.toAnimate
        self.recu = dto.received
        self.mechanismes = dto.mechanisms
        self.themes = dto.themes
        self.tags = dto.tags
        self.description = dto.description
        self.image = dto.image
        self.logo = dto.logo
        self.video = dto.video
        self.auteur = dto.author
        self.editeur = dto.editor
    }
    
    
    
    
}
