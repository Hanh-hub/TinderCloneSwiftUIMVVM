//
//  MessageRowView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/24/23.
//

import SwiftUI

struct MessageRowView: View {
    var messagePreview: MessagePreview
    var body: some View {
        HStack {
          
            RoundedImage(url: messagePreview.person.imageURLS.first)
                .frame(height: 90)
            VStack(alignment: .leading, spacing: 8) {
                Text(messagePreview.person.name)
                    .font(.system(size: 20, weight: .semibold))
                Text(messagePreview.lastMessage)
                    .lineLimit(1)
            }
            Spacer()
        
        }
        
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(messagePreview: MessagePreview.example)
    }
}
