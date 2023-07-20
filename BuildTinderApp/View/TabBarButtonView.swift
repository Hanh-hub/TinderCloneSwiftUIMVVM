//
//  TabBarButtonView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI


struct TabBarButtonView: View {
    var type: TabVarButtonType
    @EnvironmentObject var appState: AppStateManager
    var body: some View {
        Button(action: {appState.selectedTab = type}) {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.5))
        }
        .frame(height: 32)
    }
}


struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .fire)
    }
}
