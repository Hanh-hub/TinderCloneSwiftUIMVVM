//
//  MessageListViewModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/23/23.
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreview: [MessagePreview] = []
    @Published var filteredMessagePreview: [MessagePreview] = []
    

    
    init(){
        loadPreviews()
        
    }
    
    private func loadPreviews(){
        self.messagePreview = MessagePreview.examples
        filteredMessagePreview = messagePreview
    }
    
    func searchMessages(with query: String) {
        if query.isEmpty {
            filteredMessagePreview = messagePreview
        } else {
            filteredMessagePreview = messagePreview.filter {
                $0.person.name.lowercased().contains(query.lowercased()) ||
                $0.lastMessage.lowercased().contains(query.lowercased()) ||
                $0.person.bio.lowercased().contains(query.lowercased())
            }
        }
    }

}
