//
//  AuthService.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import Foundation

class AuthService{
    func login(for request: URLRequest, from bodyData: Data, delegate: URLSessionTaskDelegate? = nil) async
    throws -> (Data, URLResponse){
        let (data, response) = try await URLSession.shared.upload(for: request, from: bodyData)
        let httpresponse = response as! HTTPURLResponse // le bon type
        if httpresponse.statusCode == 201{ // tout s'est bien passé
            guard let decoded : LoginEntity = await JSONHelper.decode(data: data) else { // utilisation de notre décodeur
            throw NSError()// mauvaise récupération de données
        }
            print("decoded :", decoded)
        // conversion éventuelle du DTO decoded en instance Model
        }
        else{
            print("Error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))") // print à éviter dans une app !
        }
        return (data, response)
    }
}
