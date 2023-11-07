//
//  ContentView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppStateManager()
    @StateObject var userMng = UserViewModel()
    var body: some View {
        MainView()
            .environmentObject(appState)
            .environmentObject(userMng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
