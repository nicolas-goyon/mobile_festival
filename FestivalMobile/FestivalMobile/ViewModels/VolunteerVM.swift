//
//  VolunteerVM.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 27/03/2024.
//

import Foundation

class VolunteerVM : ObservableObject {
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
                guard let message : RegisterAnswerDTO = await JSONHelper.decode(data: data) else { // utilisation de notre décodeur
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
}

