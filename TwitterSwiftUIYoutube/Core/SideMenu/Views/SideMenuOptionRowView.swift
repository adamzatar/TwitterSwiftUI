//
//  SideMenuOptionRowView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 11/1/24.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuOptionRowView(viewModel: .profile)
}
