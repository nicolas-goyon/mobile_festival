//
//  LoginViewModel.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 19/03/2024.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var invalid : Bool = false
    @Published var token: String? = nil
    
    func login(email: String, password: String) async{
        guard let url = URL(string: ProcessInfo.processInfo.environment["API_URL"]!+"auth/login") else {
           debugPrint("bad URL")
           return
        }
        do {
            debugPrint(url)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            debugPrint("email = \(email)")
            debugPrint("password = \(password)")
            let logindto = LoginDTO(email: email, password: password)
            print("login : \(logindto)")
            guard let stringdata  = await JSONHelper.encode(data: logindto) else { fatalError() }
            guard let stringjson : LoginDTO = await JSONHelper.decode(data: stringdata) else { fatalError() }
            guard let encoded : Data = await JSONHelper.encode(data: logindto) else { fatalError() }
            let (data, response) = try await AuthService().login(for: request, from: encoded)
            
            let decoder = JSONDecoder()
            let loginEntity = try decoder.decode(LoginEntity.self, from: data)
            
            self.token = loginEntity.token
            guard let token : String = self.token else { fatalError() }
            debugPrint("token: \(token)")
            UserDefaults.standard.set(token, forKey: "token")
            
        } catch {
            print("Error during login: \(error)")
            self.invalid = true
        }
    }
    
    func logPressed(){
        print("Button pressed")
    }
    
}
