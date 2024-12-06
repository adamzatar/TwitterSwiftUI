//
//  PhotoSelectorView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 11/19/24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false // tracks whether the sheet is shown
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
                print("add image here...")
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 30)
                        .clipShape(Circle())
                }
                else{
                    CircularButton()
                        .frame(width: 180, height: 180)
                        .scaledToFill()
                        .padding(.top, 30)
                }
                
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    print("DEBUG: continued...")
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            Spacer()
        }
        
        .ignoresSafeArea()
    }
    
    
    func loadImage (){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView()
        .environmentObject(AuthViewModel())
}
