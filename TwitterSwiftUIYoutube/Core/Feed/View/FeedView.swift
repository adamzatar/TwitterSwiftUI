//
//  FeedView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 10/28/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 20, id: \.self) { _ in
                            TweetRowView()
                                .padding()
                        }
                    }
                }
                
                Button {
                    showNewTweetView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 18)
                }
                .frame(width: 56, height: 56) // Set the button size
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewTweetView){
                    NewTweetView()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FeedView()
}
