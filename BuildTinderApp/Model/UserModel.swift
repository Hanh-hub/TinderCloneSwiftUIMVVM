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
    var jobTitle: String
    var school: String?
    var distance: Int
    var vaccinated: Bool
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension Person {
    static let example: Person = Person(name: "John Doe",
                                         imageURLS: (1...5).map{ i in URL(string: "https://picsum.photos/400/\(300 + i)")!},
                                        bio: exampleBios.randomElement()!,
                                         age: 34,
                                         jobTitle: "Sushi chef",
                                         school: "University of Miami",
                                         distance: 30,
                                         vaccinated: true)
    static let example2: Person = Person(name: "Hannah",
                                         imageURLS: (1...7).map{ _ in URL(string: "https://picsum.photos/400/300")!},
                                         bio: "I love the out door stuff.",
                                         age: 34,
                                         jobTitle: "Sushi chef",
                                         distance: 30,
                                         vaccinated: true)
    static let exampleNames =  ["Jake Peralta", "Amy Santiago", "Rosa Diaz", "Terry Jeffords", "Ray Holt", "Gina Linetti", "Charles Boyle", "Hitchcock", "Scully", "Kevin"]
    static let exampleBios = ["Love the outdoors and long walks on the beach.",
                              "Avid reader and amateur pianist.", "Love to travel and experience new cultures.",
                              "Globe-trotter and photography enthusiast. Loves dogs, modern jazz, and spontaneous road trips. Seeking a partner in crime to explore uncharted territories and enjoy life's little moments.",
                              "Outdoor enthusiast and book lover with a knack for cooking. My day job involves cracking codes as a software engineer, but when I’m not in front of a computer, you’ll find me exploring hiking trails, trying out new recipes, or lost in a good book. I appreciate a good sense of humor and love interesting conversations. Let's see where a swipe right takes us!"]
    
    static let examples: [Person] = (0..<20).map{i in
    
        return Person(name: exampleNames.randomElement()!,
               imageURLS: (1...Int.random(in: 3...9)).map{ j in
            URL(string: "https://picsum.photos/400/\(300 + j)")!
        },
               bio: exampleBios.randomElement()!,
               age: Int.random(in: 18...80),
               jobTitle: ["Software Engineer", "Data Scientist", "Product Manager", "Designer", "Sushi Chef"][i%5],
               school: ["MIT", "Stanford", "Harvard", "Yale"][i%4],
               distance: Int.random(in: 1...1000),
               vaccinated: Bool.random())
    }
}


struct User {
    let name: String
    var age: Int
    let goldSubscription: Bool
}

extension User {
    static let example = User(name: "Kevin",age: 26, goldSubscription: false)
    static let example2 = User(name: "Julliana",age: 54, goldSubscription: true)
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

