//
//  HomeView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/28/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userMng: UserViewModel
    @EnvironmentObject var appStateMng: AppStateManager
    @State private var isFullscreen = false

    var body: some View {
        
        ZStack(alignment: .bottom) {
            CardStack(people: userMng.cardStack, fullScreen: $isFullscreen)
                .padding(.top, 20)
            
            if !isFullscreen {
                HStack(spacing: 20) {
                    UserButtonView(type: .rewind) {
                        appStateMng.showPurchaseScreen()
                    }
                        
                    UserButtonView(type: .dislike) {
                        if let person = userMng.cardStack.last {
                            userMng.swipe(person, .dislike)
                        }
                    }
                    UserButtonView(type: .superlike) {
                        if let person = userMng.cardStack.last {
                            if userMng.currentUser.goldSubscription {
                                userMng.superLike(person)
                            } else {
                                appStateMng.showPurchaseScreen()
                            }
                        }
                    }
                    
                    UserButtonView(type: .like) {
                        if let person = userMng.cardStack.last {
                            userMng.swipe(person, .dislike)
                        }
                    }
                    UserButtonView(type: .boost) {
                        appStateMng.showPurchaseScreen()
                    }
                }
                .padding(.bottom, 16)
            }

            Spacer()
            
        }
        .modifier(HideNavigationView())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
            .environmentObject(AppStateManager())
    }
}
