//
//  MainViewDemo3.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI

enum Tab {
    case fire, likes, message, profile
    
    var iconName: String {
        switch self {
        case .fire:
            return "flame.fill"
        case .likes:
            return "sparkle"
        case .message:
            return "message.fill"
        case .profile:
            return "person.fill"
        }
    }
    
    var displayName: String {
        return self.iconName.capitalized
    }
}

struct MainViewDemo3: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainViewDemo3_Previews: PreviewProvider {
    static var previews: some View {
        MainViewDemo3()
    }
}
