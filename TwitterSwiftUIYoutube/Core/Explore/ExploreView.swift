//
//  ExploreView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 10/29/24.
//

import SwiftUI
struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.searchableUsers) { user in
                            NavigationLink {
                            ProfileView(user: user)
                            } label: {
                            UserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
