//
//  PersonSquare.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct PersonSquare: View {
    var person: Person
    var blur: Bool
    
    var body: some View {
        GeometryReader {geo in
            ZStack(alignment: .bottomLeading){
                AsyncImage(url: person.imageURLS.first) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .blur(radius: blur ? 20 : 0)
                
                Text("\(person.name) , \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                    .font(.system(size: 18, weight: .heavy))
                    .redacted(reason: blur ? .placeholder : [])

            }
            .cornerRadius(15 )
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example, blur: false)
            .frame(width: 150, height: 240)
    }
}
