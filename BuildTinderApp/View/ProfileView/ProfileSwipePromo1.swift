//
//  ProfileSwipePromo.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import SwiftUI

struct ProfileSwipePromo1: View {
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                VStack(spacing: 9) {
                    Spacer()
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                        Text("Get Tinder Plus")
                            .font(.system(size: 26, weight: .semibold))
                    }
                    Text("Get unlimited likes, passport and more".capitalized)
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.yellow)
                        Text("Get Tinder Gold")
                            .font(.system(size: 26, weight: .semibold))
                    }
                    
                    Text("See Who likes You & More".capitalized)
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.black)
                        Text("Upgrade to Tinder Platinum")
                            .font(.system(size: 26, weight: .semibold))
                    }
                    
                    Text("Level up every action you take on tinder".capitalized)
                    
                }
                .padding(.bottom, 64)
                
            }
            .tabViewStyle(.page)
            
            Button {
                
            } label: {
                Text("Get Tinder Plus")
                    .padding(.vertical, 20)
                    .padding(.horizontal,60)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 4)
            }
            .padding(.bottom, 30)
        }
    }
}

struct ProfileSwipePromo1_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.4)
            ProfileSwipePromo1()
        }
        .frame(height: 400)
        
    }
}
