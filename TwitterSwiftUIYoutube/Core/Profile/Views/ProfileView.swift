//
//  ProfileView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 10/29/24.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private let user: User
    
    init(user: User){
        self.user = user
    }
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userinfoDetails
            tweetFilterBar
            tweetsView
            Spacer()

        }
        .navigationBarHidden(true)
        }
    }


#Preview {
    ProfileView(user: User(username: "BATMAN", fullname: "Bruce Wayne", profileImageUrl: "", email: "", uid: NSUUID().uuidString))
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            // Reduce the height of the blue background
            Color(.systemBlue)
                .ignoresSafeArea()
                .frame(height: 96) // Reduced from 150

            VStack(alignment: .leading) {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.top, 8) // Slightly less top padding
                }
            }
            
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 90, height: 90) // Adjusted size to fit proportions
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .position(x: 60, y: 100) // Adjusted position for the smaller header
        }
        .frame(height: 100) // Adjust overall height
    }
    var actionButtons: some View{
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
        }
        .padding(.trailing)
    }
    var userinfoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Your Mom's Favorite Villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    var tweetFilterBar : some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                    
                }
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                    
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))

    }
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0...9, id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
