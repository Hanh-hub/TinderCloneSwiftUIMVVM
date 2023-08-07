//
//  CircleButtonView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/27/23.
//

import SwiftUI


enum UserButtonType: String {
    case rewind = "gobackward"
    case dislike = "xmark"
    case superlike = "star.fill"
    case like = "heart.fill"
    case boost = "bolt.fill"
    
    var buttonColor: Color {
        switch self {
        case .rewind: return .yellow
        case .dislike: return .red
        case .superlike: return .blue
        case .like: return .green
        case .boost: return .purple
        }
    }
    
    var circleSize: CGFloat {
        switch self {
        case .rewind, .superlike, .boost: return 47
        case .dislike, .like: return 55
        }
    }
    
    var iconSize: CGFloat {
        return 25
    }
}

struct UserButtonView: View {
    let type: UserButtonType
    let customAction: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false
            }
            customAction()
        }) {
            Image(systemName: type.rawValue)
                .resizable()
                .fontWeight(.bold)
                .aspectRatio(contentMode: .fit)
                .frame(width: type.iconSize, height: type.iconSize)
                .foregroundColor(type.buttonColor)
                //.padding(10)
                .frame(width: type.circleSize, height: type.circleSize)
                .background(Circle().stroke(type.buttonColor, lineWidth: 2))
                
        }
        .scaleEffect(isPressed ? 0.9 : 1)
        .animation(.easeOut(duration: 0.2), value: isPressed)
    }
}


struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            HStack(spacing: 20) {
                UserButtonView(type: .rewind) {}
                    .frame(height: 50)
                UserButtonView(type: .dislike) {}
                    .frame(height: 50)
                UserButtonView(type: .superlike) {}
                    .frame(height: 50)
                UserButtonView(type: .like) {}
                    .frame(height: 50)
                UserButtonView(type: .boost) {}
                    .frame(height: 50)
            }
        }
    }
}
