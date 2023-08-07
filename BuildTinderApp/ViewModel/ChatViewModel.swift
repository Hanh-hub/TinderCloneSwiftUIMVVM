//
//  ChatViewModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/21/23.
//

import Foundation
import Combine
import UIKit


class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    
    private var person: Person
    
    var cancellable: AnyCancellable? = nil
    
    init(person: Person){
        self.person = person
        self.loadMessages()
        setUpPublisher()
    }
    
    private func loadMessages(){
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    func sendMessage(_ msg: Message){
        messages.append(msg)
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map{_ in true}
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map{_ in false}
    
    func setUpPublisher(){
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
        
}
