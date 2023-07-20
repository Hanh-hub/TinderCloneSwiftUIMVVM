//
//  MainView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/18/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .opacity(0.5)
                .ignoresSafeArea(.all, edges: .all)
          
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    TabBarButtonView(type: .fire)
                    Spacer()
                    TabBarButtonView(type: .likes)
                    Spacer()
                    TabBarButtonView(type: .message)
                    Spacer()
                    TabBarButtonView(type: .profile)
                    Spacer()
                }
                .frame(height: 100)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
    }
}

