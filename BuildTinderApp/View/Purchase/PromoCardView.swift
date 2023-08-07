//
//  PromoCardView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct PromoCardView: View {
    let imageName: String
    let mainText: String
    let subText: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
            
            Text(mainText)
                .font(.system(size: 18, weight: .semibold))
            
            Text(subText)
        }
    }
}

struct PromoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PromoCardView(imageName: "thermometer.sun.fill", mainText: "25 people already like you!", subText: "Match with them instantly")
    }
}
