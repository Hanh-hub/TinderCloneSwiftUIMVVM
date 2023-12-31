//
//  ProfileSwipePromo1.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import SwiftUI

struct PromoTabContent {
    let tabTitle: String
    let buttonTitle: String
    let description: String
    let color: Color
}

struct ProfileSwipePromo: View {
    @State private var currentTab = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    private let tabs: [PromoTabContent] = [
        PromoTabContent(tabTitle: "Get Tinder Plus", buttonTitle: "Get Tinder Plus", description: "Get Unlimited Likes, Passport and more", color: .red),
        PromoTabContent(tabTitle: "Get Tinder Gold", buttonTitle: "Get Tinder Gold", description: "See Who likes You & More", color: Color(hue: 0.131, saturation: 0.8, brightness: 0.767)),
        PromoTabContent(tabTitle: "Upgrade to Tinder Platinum", buttonTitle: "Get Tinder Platinum", description: "Level Up every Action You Take on Tinder", color: .black)
    ]
    
    var purchaseAction: () -> Void

    var body: some View {
        GeometryReader {geometry in
            VStack(spacing: 0){
                TabView(selection: $currentTab){
                    ForEach(tabs.indices, id: \.self) { i in
                       
                        VStack(spacing: 20) {
                            Spacer()
                            HStack{
                                Image(systemName: "flame.fill")
                                    .font(.system(size: 25, weight: .heavy))
                                    .foregroundColor(tabs[i].color)
                                Text(tabs[i].tabTitle)
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            Text(tabs[i].description)
                        }
                        .tag(i)
                        .padding(.bottom, 64)
                    }

                }
                .tabViewStyle(.page)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onReceive(timer) { _ in
                    currentTab = (currentTab + 1) % tabs.count
                }
                .animation(.easeIn(duration: 0.25), value: currentTab)
               
                
                Button {
                    purchaseAction()
                } label: {
                    Text(tabs[currentTab].buttonTitle)
                        .padding(.vertical,20 )
                        .padding(.horizontal, CGFloat.calculatePadding(for: tabs[currentTab].buttonTitle))
                        .frame(width: geometry.size.width * 0.70)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(tabs[currentTab].color)
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(radius: 4)
                }
                .padding(.bottom, 30)
                
            }
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray.opacity(0.6)
            ProfileSwipePromo(purchaseAction: {})
        }
        .frame(height: 400)
        
    }
}
