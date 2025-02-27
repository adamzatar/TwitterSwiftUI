//
//  MainTabView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 10/29/24.
//

import SwiftUI


struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
            .onTapGesture{
                self.selectedIndex = 0
            }
            .tabItem{
                Image(systemName: "house")
            }.tag(0)
            
            ExploreView()
            .onTapGesture{
                self.selectedIndex = 0
            }
            .tabItem{
                Image(systemName: "magnifyingglass")
            }.tag(1)
            
            NotificationsView()
            .onTapGesture{
                self.selectedIndex = 0
            }
            .tabItem{
                Image(systemName: "bell")
            }.tag(2)
            
            MessagesView()
            .onTapGesture{
                self.selectedIndex = 0
            }
            .tabItem{
                Image(systemName: "envelope")
            }.tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
