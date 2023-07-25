//
//  ChatViewHeader.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/21/23.
//

import SwiftUI

struct ChatViewHeader: View {
    
    @Environment(\.dismiss) var dismiss
    let name: String
    let imgURL: URL?
    let videoAction: () -> Void
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            HStack {
              
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                            .font(.system(size: 28, weight: .semibold))
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        //go to profile View
                    } label: {
                        VStack (spacing: 5) {
                            AsyncImage(url: imgURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(height: 40)
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.gray)
                            }
                            Text(name)
                                .font(.system(size: 14))
                                .foregroundColor(Color.textSecondary)
                        }
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Group{
                        Button {
                            videoAction()
                        } label: {
                            Image(systemName: "video.fill")
                                .font(.system(size: 20, weight: .semibold))
                        }
                       
                        Button {
                            videoAction()
                        } label: {
                            Image(systemName: "shield.fill")
                                .font(.system(size: 20, weight: .semibold))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity) // this line helps to ensure HStack takes all available width
            .padding(.horizontal, 22)
            .padding(.vertical,10)

        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewHeader(name: "Robert", imgURL: URL(string: "https://picsum.photos/200"), videoAction: {})
           
    }
}
