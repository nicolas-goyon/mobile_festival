//
//  InscriptionCreneauVM.swift
//  FestivalMobile
//
//  Created by etud on 15/03/2024.
//

import Foundation

struct InscriptionCreneauxVM{
    var creneaux : [CreneauChoixVM]
    var journees : [Date]
    
    init(creneaux: [CreneauChoixVM]){
        self.creneaux = creneaux
        self.journees = creneaux.map{ creneau in
            return creneau.dateHeureDebut
        }
    }
    
    init(festival: Festival){
        self.creneaux = festival.creneaux.map{ creneau in
            return CreneauChoixVM(creneau: creneau)
        }
        self.journees = festival.dates
    }
    
    func getCreneauxByDate(journee: Date) -> [CreneauChoixVM]{
        // dd - mm - yyyy doivent matcher
        let creneaux = self.creneaux.filter{ creneau in
            return Calendar.current.isDate(creneau.dateHeureDebut, inSameDayAs: journee)
        }
        // sort by hours (ascending)
        return creneaux.sorted{ $0.dateHeureDebut < $1.dateHeureDebut }
    }
    
    func inscription(){
        debugPrint("Inscription")
        for creneau in self.creneaux{
            if (creneau.typeChoix != TypeChoix.SansChoix){
                debugPrint("===> Inscription à \(formatHeures(creneau.dateHeureDebut)) - \(formatHeures(creneau.dateHeureFin))")
                let selection : [any ListItemProtocol] = (creneau.typeChoix == TypeChoix.Animation) ? creneau.animationSelectList.selectedData.map{$0.data} : creneau.posteSelectList.selectedData.map{$0.data}
                for item in selection{
                    let id = ConnexionToken.tokenInstance.id!
                    debugPrint("===> { zone_id: \(item.id), volunteer_id: \(id), slot_id: \(creneau.idCreneau) }")
                    
                    let urlString = ProcessInfo.processInfo.environment["API_URL"]! + "/wishes"
                    let wish = WishDTO(volunteer_id: id, zone_id: item.id.uuidString, slot_id: creneau.idCreneau)
                    let encoder = JSONEncoder()
                    encoder.outputFormatting = .prettyPrinted
                    let jsonData = try! encoder.encode(wish)
                    let url = URL(string: urlString)!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("Bearer \(ConnexionToken.tokenInstance.token!)", forHTTPHeaderField: "Authorization")
                    request.httpBody = jsonData
                    let _ = URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            print("Error took place \(error)")
                            return
                        }
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("Response data string:\n \(dataString)")
                        }
                    }
                    
                }
            }
        }
    }
    
    
    
    
    func formatHeures(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
