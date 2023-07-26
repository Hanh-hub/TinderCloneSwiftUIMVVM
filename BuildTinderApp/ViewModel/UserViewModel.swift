//
//  UserViewModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var currentUser: User = User(name: "", goldSubscription: false)
    @Published var matches: [Person] = []
    @Published var topPick: [Person] = []
    
    init(){
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    private func loadUser(){
        currentUser = User.example
    }
    private func loadMatches(){
        matches = Person.examples
    }
    
    private func loadTopPicks (){
        topPick = Person.examples.shuffled()
    }
}
