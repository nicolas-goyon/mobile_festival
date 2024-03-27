//
//  VolunteerCreate.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 22/03/2024.
//

import Foundation

class VolunteerVM: ObservableObject {
    
    @Published var id : String = UUID().uuidString
    @Published var firstname : String = ""
    @Published var lastname : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var nbEditionPerformed : Int = 0
    @Published var tshirtSize : String = TshirtSizeEnum.M.rawValue
    @Published var lodging : String = LodgingEnum.aucun.rawValue
    @Published var foodRegime : String = FoodRegimeEnum.autre.rawValue
    
    @Published var address : String = ""
    @Published var phone : String = ""
    @Published var username: String = ""
    @Published var avatarUrl: String = ""
    @Published var associations: [String] = [""]
    
    // Crée un bénévole
    func register(firstname: String, lastname: String, email: String, password: String, nbEditionPerformed: Int, tshirtSize: TshirtSizeEnum, lodging: LodgingEnum, foodRegime: FoodRegimeEnum, address: String?, phone: String?, username: String?, avatarUrl: String?) async{
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"auth/register") else {
           debugPrint("Bad URL when trying to register")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            debugPrint("email = \(email)")
            debugPrint("password = \(password)")
            let volunteerDto = VolunteerDTO(firstname: firstname, lastname: lastname, email: email, password: password, nbEditionPerformed: nbEditionPerformed, tshirtSize: tshirtSize, lodging: lodging, foodRegime: foodRegime, address: address, phone: phone, username: username, avatarUrl: avatarUrl)
            print("register : \(volunteerDto)")
            guard let stringdata  = await JSONHelper.encode(data: volunteerDto) else { fatalError() }
            guard let stringjson : VolunteerDTO = await JSONHelper.decode(data: stringdata) else { fatalError() }
            guard let encoded : Data = await JSONHelper.encode(data: volunteerDto) else { fatalError() }
            
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let httpresponse = response as! HTTPURLResponse // le bon type
            if httpresponse.statusCode == 201{ // tout s'est bien passé
                guard let message : AnswerDTO = await JSONHelper.decode(data: data) else { // utilisation de notre décodeur
                    fatalError()// mauvaise récupération de données
                }
                debugPrint("decoded :", message)
            }
            else{
                debugPrint("Error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))") // print à éviter dans une app !
            }
        } catch {
            debugPrint("Error during register: \(error)")
        }
    }
    
    // Récupère le bénévole courant
    func fetchSelf() async {
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"volunteers/me") else {
           debugPrint("Bad URL when trying to update this volunteer")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            if let token = UserDefaults.standard.string(forKey: "token") {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async{
                    if let error = error {
                        debugPrint("Error : ", error)
                    }
                    guard let data = data else {
                        debugPrint("Error : Data updating self information")
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedData = try decoder.decode(VolunteerDTO.self, from: data)
                        debugPrint("Response updating self information :", decodedData)
                        
                        self.id = decodedData.id
                        self.firstname = decodedData.firstname
                        self.lastname = decodedData.lastname
                        self.email = decodedData.email
                        self.nbEditionPerformed = decodedData.nbEditionPerformed
                        self.tshirtSize = decodedData.tshirtSize
                        self.lodging = decodedData.lodging
                        self.foodRegime = decodedData.foodRegime
                        self.address = decodedData.address ?? ""
                        self.phone = decodedData.phone ?? ""
                        self.username = decodedData.username ?? ""
                        self.avatarUrl = decodedData.avatarUrl ?? ""
                        self.associations = decodedData.associations ?? [""]
                    }
                    catch {
                        debugPrint("Error decoding JSON", error)
                    }
                }
                
            }.resume()
        }
    }
    
    // Met à jour les informations de l'utilisateur connecté
    func updateSelf() async {
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"volunteers/me") else {
           debugPrint("Bad URL when trying to get this volunteer")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            if let token = UserDefaults.standard.string(forKey: "token") {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                //request.setValue("Bearer NDM.ZoqEckgqVqOg6vPT7uDnWxjgwbimbKUQ9JqLJI5eeZqrhL6dVkuyBz14oCsU", forHTTPHeaderField: "Authorization")
            }
            
            let parameters: [String: Any] = ["id": id, "firstname": firstname, "lastname": lastname, "nb_edition_performed": nbEditionPerformed, "tshirt_size": tshirtSize, "lodging": lodging, "food_regime": foodRegime, "address": address, "phone":phone, "username":username, "avatar_url":avatarUrl, "associations":associations]
            debugPrint("parameters : ", parameters)
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                debugPrint("Error while encoding parameters for Volunteer update")
                return
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async{
                    if let error = error {
                        debugPrint("Error : ", error)
                    }
                    guard let data = data else {
                        debugPrint("Error : Data update self information")
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        
                        print(String(data: data, encoding: .utf8) ?? "No data")
                        
                        let decodedData = try decoder.decode(AnswerDTO.self, from: data)
                        debugPrint("Response update self information :", decodedData)
                    }
                    catch {
                        debugPrint("Error decoding JSON", error)
                    }
                }
                
            }.resume()
        }
    }
    
    
}
