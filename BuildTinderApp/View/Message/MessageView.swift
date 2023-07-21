//
//  MessageView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/21/23.
//

import SwiftUI

struct ThreeCornersRounded: Shape {
    var radius: CGFloat
    var roundBottomLeft: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if roundBottomLeft {
            // Round all corners except bottom left corner
            path.move(to: CGPoint(x: rect.minX, y: rect.minY + radius))
            path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        } else {
            // Round all corners except bottom right corner
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        }
        
        return path
    }
}



struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
      
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 70 ))
        path.addLine(to: CGPoint(x: rect.minX - 50, y: rect.minY + 70))
        


        return path
    }
}

struct Circle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.addArc(center: center, radius: radius, startAngle: .init(degrees: 270), endAngle: .init(degrees: 0), clockwise: false)

        return path
        
//        return Path { path in
//            path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: Angle(degrees: 360), clockwise: true)
//        }
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat
    var rightCornerExcluded: Bool = true
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //radius of 4 corners's cirlce
        var topLeft = CGPoint(x: rect.minX + radius, y: rect.minY + radius)
        var topRight = CGPoint(x: rect.maxX - radius, y: rect.minY + radius)
        var bottomLeft = CGPoint(x: rect.minX + radius, y: rect.maxY - radius)
        var bottomRight = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        
        //starting point at top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        //draw arc at top left
        path.addArc(center: topLeft, radius: radius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        
        //draw a line from top left to top right and draw arc
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        path.addArc(center: topRight, radius: radius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        
        //Draw a line from top right corner to bototm right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
       
        if rightCornerExcluded {
            //skip the arc for the bottom right corner
            path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
            //arc for left corner
            path.addArc(center: bottomLeft, radius: radius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
            
        } else {
            //arc for bottom right corner
            path.addArc(center: bottomRight, radius: radius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
            //connect bottom right corner to bottom left corner
           path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY))
        }
        
        //connect bottom left to top left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY ))
        return path
    }
}

struct MessageView: View {
    var message: Message
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            
            Text(message.content)
                .padding()
                .foregroundColor(message.fromCurrentUser ? .white : .black)
                .background(message.fromCurrentUser ? .blue : .gray.opacity(0.20))
                .clipShape(RoundedCorners(radius: 25, rightCornerExcluded: message.fromCurrentUser ? true : false))
               // .clipShape(ChatBubble(isFromCurrentUser: message.fromCurrentUser))
                .cornerRadius(1)
                
            if  !message.fromCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: isFromCurrentUser ? [.topLeft, .bottomLeft, .topRight] : [.topRight, .bottomRight, .topLeft],
                                cornerRadii: CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleSent)
            
    }
}
