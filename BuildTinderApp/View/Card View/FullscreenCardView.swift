//
//  FullscreenCardView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/27/23.
//

import SwiftUI


@ViewBuilder
func infoRow(icon: String, text: String) -> some View {
    HStack {
        Image(systemName: icon)
            .font(.system(size: 18, weight: .medium))
            .alignmentGuide(.leading) { d in d[.trailing] }
            .frame(width: 25, alignment: .center) // Set fixed width to align icons
    
        Text(text)
            .font(.system(size: 18, weight: .medium))
    }
}

// Reuse this view to create each button
@ViewBuilder
func actionButton(title: String, subtitle: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
        VStack(spacing: 5){
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(subtitle)
        }
    }
    .foregroundColor(.black)
}

struct FullscreenCardView: View {
    var person: Person
    @EnvironmentObject var userMng: UserViewModel
    
    @Binding var fullScreen: Bool
    @State private var showingShareSheet = false
    
    var body: some View {
        GeometryReader {geo in
            ZStack(alignment: .bottom) {
                Color.white.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 0) {
                        CardImageScroller(person: person, fullscreenMode: $fullScreen)
                            .frame(width: geo.size.width, height: geo.size.height * 0.6)
                        //MARK: - Name , age, distance
                        HStack{
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .bold))
                                    Text("\(person.age)")
                                        .font(.system(size: 28, weight: .light))
                                    Spacer()
                                }
                                .opacity(0.75)
                                .padding(.bottom, 8)
                            
                                
                                VStack(alignment: .leading, spacing: 5){
                                    infoRow(icon: "suitcase", text: person.jobTitle)
                                    infoRow(icon: "graduationcap", text: person.school ?? "Trade school")
                                         
                                    if person.vaccinated {
                                         infoRow(icon: "syringe", text: "Vaccinated")
                                     }
                                     
                                    infoRow(icon: "mappin.and.ellipse", text: "\(person.distance) \(person.distance > 1 ? "miles" : "mile") away")
                                }
                                
                            }
                            .padding([.horizontal, .top], 16)
                            .foregroundColor(.black)
                            
                            Button {
                                fullScreen = false
                            } label: {
                                Image(systemName: "arrowshape.forward.fill")
                                    .rotationEffect(.degrees(90))
                                    .font(.system(size: 20, weight: .heavy))
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .clipShape(Circle())
                            }
                            .offset(y: -90)
                            .padding(.trailing, 16)

                        }
                        Spacer().frame(height: 15)
                        //MARK: - BIO
                        Divider()
                            .padding(.vertical, 5)
                        
                        BioView(person: person)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)

                        Divider()
                            .padding(.vertical, 10)
                        
                        VStack{
                            actionButton(title: "Share Profile", subtitle: "See what a friend thinks") { showActionSheet()}
                               
                                
                            Divider()
                                .padding(.vertical, 5)
                            
                            actionButton(title: "Block \(person.name)", subtitle: "You won't see them and they won't see you") { /* action here */ }
                            
                            Divider()
                                .padding(.vertical, 5)
                            
                            actionButton(title: "Report \(person.name)", subtitle: "Don't worry - we won't tell them") { /* action here */ }
                            Divider()
                                .padding(.vertical, 5)
                        }
                        .foregroundColor(.black)
                    }
                    Spacer().frame(height: 150)
                }
                
                HStack(spacing: 20){
                    Group{
                       
                        UserButtonView(type: .dislike) {
                            fullScreen = false
                            userMng.swipe(person, .dislike)
                        }
                        UserButtonView(type: .superlike) {
                            fullScreen = false
                            userMng.superLike(person)
                        }
                        UserButtonView(type: .like) {
                            fullScreen = false 
                            userMng.swipe(person, .like)
                        }
                        
                       
                          
                    }
                    .background(.white)
                    .clipShape(Circle())
                }
                .frame(height: 45)
                .padding(.top, 25)
                .padding(.bottom, 45)
                .edgesIgnoringSafeArea(.bottom)
                .frame(width: geo.size.width)
                .background(.linearGradient(Gradient(colors: [.white.opacity(0.2), .white]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 50))

            }
            .padding(.top, 20)
            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil )
    }
}

struct FullscreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullscreenCardView(person: Person.example,fullScreen: .constant(true))
            .environmentObject(UserViewModel())
    }
}

struct BioView: View {
    var person: Person
    var body: some View {
        VStack(alignment: .leading){
            Text("About me")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            HStack{
                Text(person.bio)
                    .font(.system(size: 18, weight: .medium))
                    .opacity(0.75)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
        }
    }
}
