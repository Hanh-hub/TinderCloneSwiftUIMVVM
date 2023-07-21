//
//  MainViewDemo.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI


struct MainView2: View {
    @EnvironmentObject var appState: AppStateManager

    var body: some View {
        TabView(selection: $appState.selectedTab) {
            Text("fire view")
                .tabItem {
                    Image(systemName: "flame")
                    Text("Fire")
                }
                .tag(TabVarButtonType.fire)

            Text("likes")
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("Likes")
                }
                .tag(TabVarButtonType.likes)

            Text("message")
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
}

struct MainViewDemo_Previews2: PreviewProvider {
    static var previews: some View {
        MainView2()
            .environmentObject(AppStateManager())
    }
}
