//
//  MessageModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/20/23.
//

import Foundation


struct Message: Identifiable {
    var id = UUID()
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

struct MessagePreview: Identifiable {
    var id = UUID()
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the weather where you live right now?")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the weather where you live right now?"),
        MessagePreview(person: Person.example2, lastMessage: "Hi there")
    ]
}


//struct Message2 {
//    var id: String
//    var sender: User
//    var recipient: User
//    var content: String
//    var dateSent: Date
//}
