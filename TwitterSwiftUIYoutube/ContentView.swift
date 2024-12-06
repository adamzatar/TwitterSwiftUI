//
//  ContentView.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 10/28/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            //no user logged in
            if viewModel.userSession == nil{
                LoginView()
            } else{
                //have a logged in user
                mainInterfaceView
            }
                    
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView{
    var mainInterfaceView: some View{
        NavigationView {
            ZStack(alignment: .topLeading) {
                MainTabView()

                    .navigationBarHidden(showMenu)

                if showMenu{
                    ZStack{
                        Color(.black)
                            .opacity(showMenu ? 0.25 : 0.00)
                    }.onTapGesture {
                        withAnimation(.easeInOut){
                            showMenu = false
                        }
                    }
                    .ignoresSafeArea()
                }
                
                SideMenuView()
                    .frame(width: 300)
                    .offset(x: showMenu ? 0 : -300, y: 0)
                    .background(showMenu ? Color.white : Color.clear)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    if let user = viewModel.currentUser{
                        Button{
                            withAnimation(.easeInOut){
                                showMenu.toggle()
                            }
                        }label:{
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .frame(width: 32, height: 32)
                                .scaledToFill()
                                .clipShape(Circle())
                            }
                    }

                }
            }
            .onAppear{
                showMenu = false
            }
        }
    }
}
