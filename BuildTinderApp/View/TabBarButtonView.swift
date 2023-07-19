//
//  TabBarButtonView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI

enum TabVarButtonType: String {
    case fire = "flame.fill"
    case likes = "sparkle"
    case profile  = "person.fill"
    case message = "message.fill"
}

struct TabBarButtonView: View {
    var type: TabVarButtonType
    var action: () -> Void
    var body: some View {
        Button(action: {action()}) {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.5))
        }
    }
}


struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .fire, action: {})
    }
}
