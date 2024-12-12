//
//  ProfileView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var username: String = "John Doe"
    @State private var email: String = "john.doe@example.com"
    @State private var phoneNumber: String = "+1234567890"
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Profile Picture Section
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(.top, 50)
                    Text(username)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                }
                
                // Information Section
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("Name", text: $username)
                            .disabled(!isEditing)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .disabled(!isEditing)
                        TextField("Phone Number", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .disabled(!isEditing)
                    }
                    
                    // Edit or Save Button
                    Section {
                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Text(isEditing ? "Save Changes" : "Edit Profile")
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                .scrollContentBackground(.hidden) // Remove background from the form
                
                Spacer()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
