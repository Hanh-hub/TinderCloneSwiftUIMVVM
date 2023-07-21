//
//  MessageModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import Foundation


struct Message {
    var content: String
    var senderName: String? = nil
    
    var fromCurrentUser: Bool {
        return senderName == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "How it's going?", senderName: nil)
    static let exampleReceived = Message(content: "I am fine. How are you?", senderName: "Stephen")
}

struct MessagePreview {
    var person: Person
    var lastMessage: String
}
extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there!")
}

//struct Message2 {
//    var id: String
//    var sender: User
//    var recipient: User
//    var content: String
//    var dateSent: Date
//}
