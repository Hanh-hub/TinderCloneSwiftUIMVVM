//
//  ProfileView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userMng: UserViewModel
    @EnvironmentObject var appState: AppStateManager
    
    var user: User {
        return userMng.currentUser
    }
    var body: some View {
        VStack {
            ZStack(){
                Circle()
                    .stroke(Color.gray, lineWidth: 4)
                    .frame(width: 180, height: 180)
            
                RoundedImage(url: URL(string: "https://picsum.photos/400"))
                    .frame(height: 170)
                
                Image(systemName: "applepencil")
                    .font(.system(size: 18, weight: .heavy))
                    .frame(width: 32, height: 32)
                    .foregroundColor(.gray)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(radius: 6)
                    .offset(x:70,y:-60)
            }
         
            Spacer().frame(height: 18)
            
            Text("\(user.name), \(user.age)")
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.textTitle)
            
            Spacer().frame(height: 22)
            
            HStack(alignment: .top) {
               Spacer()
                
               Button(action: {}) {
                    VStack {
                        Image(systemName: "gearshape")
                            .foregroundColor(.gray.opacity(0.8))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SETTINGS")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 38))
                            .padding(23)
                            .background(.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("MEDIA")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "shield.fill")
                            .foregroundColor(.gray.opacity(0.8))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SAFETY")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                }
                Spacer()
            }
            
            HStack{
                Text("Photo tip: it's summertime makes wave and get more likes with beach photos")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 14, weight: .heavy))
                        .foregroundColor(.pink)
                        .padding(6)
                        .background(.white)
                }
                .clipShape(Circle())
            }
            .padding(10)
            .background(.pink)
            .cornerRadius(12)
            .padding(.horizontal )
            
            if !user.goldSubscription {
                ProfileSwipePromo(purchaseAction: {
                    appState.showPurchaseScreen()
                })
                    .background(.gray.opacity(0.45))
                    .padding(.bottom, 15)
            }
            

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(UserViewModel())
            .environmentObject(AppStateManager())
            
    }
}
