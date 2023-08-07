//
//  UserViewModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import Foundation

enum SwipeDirection {
    case dislike
    case like
}

class UserViewModel: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 25, goldSubscription: false)
    @Published var matches: [Person] = []
    @Published var topPick: [Person] = []
    @Published var cardStack: [Person] = []
    
    init(){
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardStack() 
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
    
    private func loadCardStack(){
        cardStack = Person.examples
    }
    
    func swipe(_ person: Person, _ swipeDirection: SwipeDirection){
        cardStack.removeLast()
    }
    func superLike(_ person: Person ){
        cardStack.removeLast()
    }
}
