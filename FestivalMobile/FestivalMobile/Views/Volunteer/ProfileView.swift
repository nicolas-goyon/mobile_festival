//
//  ProfileView.swift
//  FestivalMobile
//
//  Created by Suzanne ROBERT on 27/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel : VolunteerVM
    
    @State var isEditing : Bool = false
    
    let greenMedium = Color(UIColor(red: 115/255, green: 150/255, blue: 0/255, alpha: 1))
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Profile").font(.title)
                AsyncImage(url: URL(string: viewModel.avatarUrl)){ phase in
                    if let image = phase.image {
                        image
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        Image(uiImage: UIImage(named: "user")!)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .background(greenMedium.opacity(0.5))
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .overlay(Circle().stroke(greenMedium, lineWidth: 1))
                
                TextField("Firstname", text: $viewModel.firstname)
                    .frame(width: 300)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .disabled(!self.isEditing) // Désactive le champ lorsque isEditing est false
                    .opacity(self.isEditing ? 1.0 : 0.5) // Grise le champ lorsque isEditing est false
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(greenMedium, lineWidth: 1).opacity(self.isEditing ? 1.0 : 0.5))
                
                TextField("Lastname", text: $viewModel.lastname)
                    .frame(width: 300)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .hoverEffect()
                    .disabled(!self.isEditing) // Désactive le champ lorsque isEditing est false
                    .opacity(self.isEditing ? 1.0 : 0.5) // Grise le champ lorsque isEditing est false
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(greenMedium, lineWidth: 1).opacity(self.isEditing ? 1.0 : 0.5))
                
                TextField("Email", text: $viewModel.email)
                    .frame(width: 300)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .hoverEffect()
                    .disabled(true) // Désactive le champ lorsque isEditing est false
                    .opacity(0.5) // Grise le champ lorsque isEditing est false
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(greenMedium, lineWidth: 1).opacity(self.isEditing ? 1.0 : 0.5))
                
                Button(!self.isEditing ? "Edit" : "Save"){
                    Task{
                        if self.isEditing {
                            await viewModel.updateSelf()
                        }
                        self.isEditing = !self.isEditing
                    }
                }
                .padding(10)
                .frame(width: 138)
                .background(greenMedium.opacity(0.25))
                .foregroundColor(greenMedium)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(greenMedium, lineWidth: 1))
            }
        }
        .onAppear(){
            Task{
                await viewModel.fetchSelf()
            }
        }
    }
}
