//
//  ChatView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/22/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatViewModel: ChatViewModel
    @State private var typingMessage: String = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
     
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatViewModel = ChatViewModel(person: person)
    }
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 60)
                ScrollView(.vertical, showsIndicators: false){
                    ScrollViewReader {proxy in
                        LazyVStack(){
                            ForEach(chatViewModel.messages.indices, id: \.self){ index in
                                let msg = chatViewModel.messages[index]
                                MessageView(message: msg).id(index)
                            }
                        }
                        .onAppear {
                            scrollProxy = proxy
                        }
                    }
                    
                }
                
                ZStack(alignment: .trailing) {
                    Color.textfieldBG
                    
                    TextField("Send a message", text: $typingMessage)
                        .foregroundColor(.textPrimary)
                        //.textFieldStyle(.roundedBorder)
                        .frame(height: 45)
                        .padding(.horizontal)
                        .cornerRadius(20)
                    
                    Button {
                        chatViewModel.sendMessage(Message(content: typingMessage))
                        typingMessage = ""

                    } label: {
                        Text("Send")
                            
                    }
                    .disabled(typingMessage.isEmpty ? true : false)
                    .padding(.horizontal, 7)

                }
                .frame(height: 40)
                .cornerRadius(20)
                .padding(.horizontal, 30)
                
            }

            ChatViewHeader(name: person.name,
                           imgURL: person.imageURLS.first,
                           videoAction: {})
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .onChange(of: chatViewModel.keyboardIsShowing) { newValue in
            if newValue {
                scrollToBottom()
            }
        }
        .onChange(of: chatViewModel.messages.count) { newValue in
            scrollToBottom()
        }

    }
    func scrollToBottom(){
        withAnimation {
            scrollProxy?.scrollTo(chatViewModel.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
