//
//  MainView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/18/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .opacity(0.5)
                .ignoresSafeArea(.all, edges: .all)
          
            VStack {
                Spacer()
                HStack {
                    
                    TabBarButtonView(type: .fire, action: {})
                    TabBarButtonView(type: .likes, action: {})
                    TabBarButtonView(type: .message, action: {})
                    TabBarButtonView(type: .profile, action: {})
                  
                }
                .frame(height: 100)
            }

            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

