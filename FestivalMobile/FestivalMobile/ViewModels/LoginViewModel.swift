//
//  LoginViewModel.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var invalid : Bool = false
    var token: ConnexionToken = ConnexionToken.tokenInstance
    
    func login(email: String, password: String) async -> String? {
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"auth/login") else {
           debugPrint("bad URL")
           return nil
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let logindto = LoginDTO(email: email, password: password)
            guard let encoded : Data = await JSONHelper.encode(data: logindto) else { fatalError() }
            let (data, _) = try await AuthService().login(for: request, from: encoded)
            
            let decoder = JSONDecoder()
            let loginEntity = try decoder.decode(LoginEntity.self, from: data)
            
            return loginEntity.token
            
        } catch {
            print("Error during login: \(error)")
            self.invalid = true
            return nil
        }
    }
    
    func logPressed(){
        print("Button pressed")
    }
    
}
