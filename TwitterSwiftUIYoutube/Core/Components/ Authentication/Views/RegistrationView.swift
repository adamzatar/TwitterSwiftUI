//
//  RegistrationView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 11/3/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                AuthHeaderView(title1: "Get Started.", title2: "Create Your Account")
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullname)
                    CustomInputField(imageName: "lock",
                                     placeholderText: "Password",
                                     isSecureField: true,
                                     text: $password)
                }
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email,
                                       password: password,
                                       fullname: fullname,
                                       username: username)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
            }
            .ignoresSafeArea()
            // Navigate to the profile photo selector view when `didAuthenticateUser` becomes true
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
