//
//  LikesView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import SwiftUI

struct LikesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                Text("hello 1")
                Text("hello 2")
                Text("hello 3")
                Text("hello 4")
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
