//
//  FestivalModel.swift
//  FestivalMobile
//
//  Created by etud on 22/03/2024.
//

import Foundation

class Festival : Equatable, Identifiable{
    static func == (lhs: Festival, rhs: Festival) -> Bool {
        return lhs._id == rhs._id
    }
    
    
    public private(set) var _id :           String
    public private(set) var nom :           String
    public private(set) var adresse :       String
    public private(set) var description :   String
    public private(set) var dates :         [Date]
    public var creneaux :      [Creneau]
    public var jeux :          [Jeu]
    
    init(id : String, nom : String, adresse : String, description : String, dates : [Date], creneaux : [Creneau], jeux : [Jeu]){
        self._id = id
        self.nom = nom
        self.adresse = adresse
        self.description = description
        self.dates = dates
        self.creneaux = creneaux
        self.jeux = jeux
    }
    
    init(festivalDTO : FestivalDTO){
        self._id = festivalDTO.id
        self.nom = festivalDTO.title
        self.adresse = festivalDTO.address
        self.description = festivalDTO.description
        // DTO's date : dd/mm/yyyy
        let startDate: Date = DateHelper.date(from: festivalDTO.startDate)
        let endDate: Date = DateHelper.date(from: festivalDTO.endDate)
        
        // Create an array of dates between startDate and endDate included
        self.dates = DateHelper.dates(from: startDate, to: endDate)

        self.creneaux = []
        self.jeux = []
    }
    
    init(festivalArrayElementDTO : FestivalArrayElementDTO){
        self._id = festivalArrayElementDTO.id
        self.nom = festivalArrayElementDTO.title
        self.adresse = festivalArrayElementDTO.address
        self.description = festivalArrayElementDTO.description
        // DTO's date : dd/mm/yyyy
        let startDate: Date = DateHelper.date(from: festivalArrayElementDTO.start_date)
        let endDate: Date = DateHelper.date(from: festivalArrayElementDTO.end_date)
        
        // Create an array of dates between startDate and endDate included
        self.dates = DateHelper.dates(from: startDate, to: endDate)
        
        self.creneaux = []
        self.jeux = []
    }
}


struct DateHelper {
    
    static func date(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: string)!
    }
    
    static func dates(from startDate: Date, to endDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = startDate
        while date <= endDate {
            dates.append(date)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        }
        return dates
    }
}
