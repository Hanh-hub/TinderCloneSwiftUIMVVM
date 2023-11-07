//
//  CardStack.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/28/23.
//

import SwiftUI

struct CardStack: View {
    var people: [Person]
    @Binding var fullScreen: Bool
    var body: some View {
        
        GeometryReader {geo in
            ZStack{
                ForEach(people) { person in
                    CardView(person: person, fullScreen: $fullScreen)
                }
                
            }
           // .frame(width: geo.size.width, height: fullScreen ? geo.size.height : 550)
        }
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples.shuffled(), fullScreen: .constant(false))
    }
}
