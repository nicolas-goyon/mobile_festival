//
//  AccountView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 26/03/2024.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            return LoginView()
        }
        return RegisterView()
    }
}

#Preview {
    AccountView()
}
