//
//  MainViewDemo.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    

    var body: some View {
        
        NavigationView {
            TabView(selection: $appState.selectedTab) {
                Text("fire view")
                    .tabItem {
                        Image(systemName: "flame")
                        Text("Fire")
                    }
                    .tag(TabVarButtonType.fire)

                MatchesView()
                    .tabItem {
                        Image(systemName: "sparkle")
                        Text("Likes")
                    }
                    .tag(TabVarButtonType.likes)

                MessageListView()
                    .tabItem {
                        Image(systemName: "message")
                        Text("Messages")
                    }
                    .tag(TabVarButtonType.message)

                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(TabVarButtonType.profile)
            }
            .tint(appState.selectedTab == .likes ? .yellow : .red)
        }
       // .modifier(HideNavigationView())
        
    }
}

struct MainViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserViewModel())
    }
}
