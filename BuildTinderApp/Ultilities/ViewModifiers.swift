//
//  ViewModifiers.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/24/23.
//

import Foundation
import SwiftUI

extension Image {
    func circleImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}


struct HideNavigationView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

 
