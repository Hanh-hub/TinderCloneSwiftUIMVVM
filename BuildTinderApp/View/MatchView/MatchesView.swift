//
//  MatchesView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct MatchesView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var appState: AppStateManager
    
    enum LikedTab: String {
        case likes
        case topPicks
        
        var buttonTitle: String {
            switch self {
            case .likes:
                return "See who likes you"
            case .topPicks:
                return "Unlock top picks?"
            }
        }
        
        var description: String {
            switch self {
            case . likes:
                return "Upgrade to Gold to see people who already liked you"
            case .topPicks:
                return "Upgrade to Tinder Gold for more Top Picks!"
            }
        }
    }
    var matchesCount: Int {
        return userViewModel.matches.count
    }
    var topPicksCount: Int {
        return userViewModel.topPick.count
    }
    
    @State var selectedTab: LikedTab = .likes
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                VStack{
                    HStack{
                      
                        Button {
                            selectedTab = .likes
                        } label: {
                            Text("\(matchesCount > 99 ? "99+ Likes" : "\(matchesCount) Likes")")
                                .foregroundColor(selectedTab == . likes ? .black: .textPrimary)
                        }
                     
                        Divider()
                            .frame(height: 24)
                            .padding(.horizontal, 30)

                        Button {
                            selectedTab = .topPicks
                        } label: {
                            Text("\(topPicksCount) Top Picks")
                                .foregroundColor(selectedTab == .topPicks ? .black : .textPrimary)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.system(size: 16, weight: .semibold))
                    
                    Divider()
                        .padding(.vertical, 14)
                    
                    if selectedTab == .likes {
                        LikesView(likesOrTopPicksList: userViewModel.matches, description: selectedTab.description, blur: !userViewModel.currentUser.goldSubscription)
                    } else {
                        LikesView(likesOrTopPicksList: userViewModel.topPick, description: selectedTab.description, blur: false)
                    }
                }
                Button {
                    appState.showPurchaseScreen()
                    
                } label: {
                    Text(selectedTab.buttonTitle.uppercased())
                        .padding(.vertical, 14)
                        .padding(.horizontal, CGFloat.calculatePadding(for: selectedTab.buttonTitle))
                        .frame(width: geo.size.width * 0.80)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.black)
                        .background(Color.goldBG)
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 40)

            }
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserViewModel())
            .environmentObject(AppStateManager())
    }
}
