//
//  CardImageScroller.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/26/23.
//

import SwiftUI

struct CardImageScroller: View {
    var person: Person
    var maxIndex: Int {
        return person.imageURLS.count
    }
    
    @State private var selectedImageIndex = 0
    @Binding var fullscreenMode: Bool
    
    func updateImageIndex(increase: Bool){
        selectedImageIndex = increase ? min(maxIndex - 1 , selectedImageIndex + 1) : max(0, selectedImageIndex - 1)
    }
    
    var body: some View {
        GeometryReader {geo in
            ZStack{
                AsyncImage(url: person.imageURLS[selectedImageIndex]) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                } placeholder: {
                    Rectangle()
                }
                
                VStack {
                    HStack {
                        Image("likeButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .opacity(Double(person.x / (geo.size.width / 2 * 0.4)) - 1)
                        
                        Spacer()
                        
                        Image("nopeButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .opacity(Double(person.x / (geo.size.width / 2 * 0.4) * -1 - 1))
                    }
                    
                    Spacer()
                }
                
                HStack(spacing: 0){
                    Rectangle()
                        .onTapGesture {
                          updateImageIndex(increase: false)
                        }
                    Rectangle()
                        .onTapGesture {
                          updateImageIndex(increase: true)

                        }
                }
                .foregroundColor(Color.white.opacity(0.1))
                
                //MARK: - Indicator bar
                VStack{
                    HStack{
                        ForEach(0..<person.imageURLS.count, id: \.self){index in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 5)
                                .foregroundColor(selectedImageIndex == index ? .white : .gray.opacity(0.5))
                            
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, fullscreenMode ? 0 : 12)
                    
                    Spacer()
                }
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, fullscreenMode: .constant(false))
    }
}
