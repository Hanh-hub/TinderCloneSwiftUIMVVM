//
//  CardView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/26/23.
//

import SwiftUI

struct CardView: View {
    @State var person: Person
    @Binding var fullScreen: Bool
    
    
    var body: some View {
        
        GeometryReader { geo in
            if fullScreen{
                FullscreenCardView(person: person, fullScreen: $fullScreen)
            } else {
                ZStack(alignment: .bottom) {
                    CardImageScroller(person: person, fullscreenMode: $fullScreen)
                        .frame(height: geo.size.height * 0.9)
                        .padding(.bottom, 80)

                    Color.black
                        .frame(height: 90)
                        .shadow(color: .black, radius: 15)
                        
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .bold))
                                Text("\(person.age)")
                                    .font(.system(size: 28, weight: .semibold))
                            }
                           
                            Spacer().frame(height: 10)
                            
                            Text(person.bio)
                                .font(.system(size: 18, weight: .medium))
                                .lineLimit(5)
                               
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "arrowshape.left.fill")
                            .font(.system(size: 14, weight: .bold))
                            .rotationEffect(.degrees(90))
                            .padding(.all, 6)
                            .background(Color.white)
                            .clipShape(Circle())

                    }
                    .onTapGesture {
                        fullScreen = true
                    }
                    .padding(16)
                    .padding(.bottom, 90)
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                    


                }
                .cornerRadius(20)
               
                   
               // CardImageScroller(person: person, fullscreenMode: $fullScreen)
                
                .animation(.easeOut(duration: 0.25), value: person.x)
                .frame(width: geo.size.width - 20 , height: geo.size.height)
                .padding(.leading, 10)
                .offset(x: person.x, y: person.y )
                .rotationEffect(.degrees(person.degree ))
                .gesture(
                    DragGesture()
                        .onChanged({ dragValue in
                            withAnimation(.default) {
                                person.x = dragValue.translation.width
                                person.y = dragValue.translation.height
                                withAnimation {
                                    person.degree = dragValue.translation.width / 25
                                }
                                
                            }
                        })
                        .onEnded({ dragValue in
                            withAnimation(.interpolatingSpring(mass: 1.0,stiffness: 50, damping: 10,initialVelocity: 0 )) {
                                let width = dragValue.translation.width
                                let screenCutoff = (geo.size.width / 2)*0.8
                                
                                switch width {
                                    case -screenCutoff...screenCutoff:
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    case screenCutoff...:
                                       // Swipe right
                                       person.x = 500
                                       person.degree = 12
                                    case (-.infinity)...(-screenCutoff):
                                           // Swipe left
                                       person.x = -500
                                       person.degree = -12
                                    default:
                                        break
                                    }
                            }
                        })
                )
            }
        }
 
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullScreen: .constant(true))
        CardView(person: Person.example, fullScreen: .constant(false))
    }
}
