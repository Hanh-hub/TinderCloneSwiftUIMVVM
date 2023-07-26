//
//  PurchaseSwipePromo.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    @State private var selectedTab: Int = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PromoCardView(imageName: "thermometer.sun.fill", mainText: "25 people already like you!", subText: "Match with them instantly")
                .tag(0)
            PromoCardView(imageName: "paperplane.circle.fill", mainText: "25 people already like you!", subText: "Match with them instantly")
                .tag(1)
            PromoCardView(imageName: "calendar.badge.plus", mainText: "25 people already like you!", subText: "Match with them instantly")
                .tag(2)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onReceive(timer) { time in
            selectedTab  = (selectedTab + 1) % 3
        }
        .animation(.easeIn(duration: 0.25), value: selectedTab)

    }
}

struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geo in
            PurchaseSwipePromo()
                .background(Color.gray.opacity(0.5))
                .frame(height: geo.size.height / 3)
                .padding(.top, geo.size.height / 4)
        }
            
    }
}
