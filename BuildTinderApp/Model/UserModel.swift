//
//  UserModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import Foundation


struct Person {
    var name: String
    var imageURLS: [URL]
    var bio: String
}

extension Person {
    static let example = Person(name: "Hannah", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I love dogs and outdoor stuff")
    static let example2 = Person(name: "Julian", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "Looking for friends. I like working out")
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

