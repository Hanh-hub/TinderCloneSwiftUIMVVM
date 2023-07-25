//
//  ContentView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    var appState = AppStateManager()
    var body: some View {
        MainView()
            .environmentObject(appState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
