//
//  LikesView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct LikesView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var appStateManager: AppStateManager
    
    private var currentUser: User {
        return userViewModel.currentUser
    }
    
    var likesOrTopPicksList: [Person]
    
    var description: String = "Upgrade to Gold to see people who already liked you"
    
    var blur: Bool  = false
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            Text(description)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.textTitle)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                      alignment: .center
            ) {
                ForEach(likesOrTopPicksList){person in
                    PersonSquare(person: person, blur: blur)
                        .frame(height: 240)
                        .onTapGesture {
                            //personTapped(person)
                        }
                    
                }
            }
            .padding(.horizontal, 5)
            
            
        }
    }
    func personTapped(_ person: Person){
        if userViewModel.currentUser.goldSubscription {
            appStateManager.showPersonProfile(person)
        } else {
            appStateManager.showPurchaseScreen()
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView(likesOrTopPicksList: Person.examples)
            .environmentObject(UserViewModel())
            .environmentObject(AppStateManager())
    }
}
