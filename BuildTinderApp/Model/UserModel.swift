//
//  UserModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import Foundation


struct Person: Identifiable {
    var id = UUID()
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
}

extension Person {
    static let example = Person(name: "Hannah", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33)
    static let example2 = Person(name: "Julian", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "Looking for friends. I like working out", age: 24)
    static let examples: [Person] = [
        Person(name: "Josh", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Chris", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Hoang", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Stephen", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Jimmy", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Jungsuk", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Sean", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Miller", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Paul", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33),
        Person(name: "Linda", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff", age: 33)
    ]
}


struct User {
    let name: String
    let goldSubscription: Bool
}

extension User {
    static let example = User(name: "Kevin", goldSubscription: false)
    static let example2 = User(name: "Julliana", goldSubscription: true)
}


//struct User {
//    var id: String
//    var name: String
//    var age: Int
//    var bio: String
//    var profileImageURL: String
//}
//
//struct UserProfile {
//    var user: User
//    var photos: [String]
//    var location: String
//    var jobTitle: String
//}
//
//
//struct Match {
//    var id: String
//    var user1: User
//    var user2: User
//    var date: Date
//}
//struct Swipe {
//    var id: String
//    var swipedUser: User
//    var isLiked: Bool
//}
//
//struct CurrentUser {
//    var user: User
//    var likedProfiles: [User]
//    var email: String
//}
//
//let currentUser = User(id: "0", name: "Hannah", age: 26, bio: "I like cooking and working out", profileImageURL:  "https://picsum.photos/200/300")
//let currentUserProfile = UserProfile(user: currentUser, photos: ["https://picsum.photos/200/300",
//                                                                 "https://picsum.photos/200/300",
//                                                                 "https://picsum.photos/200/300"],
//                                     location: "Austin", jobTitle: "Software Engineer")

