//
//  MessageListView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/24/23.
//

import SwiftUI

struct MessageListView: View {
    @State private var searchText: String = ""
    @State private var isEditting: Bool = false
    @StateObject var messageListViewModel: MessageListViewModel = MessageListViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Search a match", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textfieldBG)
                        .cornerRadius(20)
                        .overlay(content: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading, 4)
                                Spacer()
                            }
                        })
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            isEditting = true
                        }
                        .onChange(of: searchText, perform: { newValue in
                            messageListViewModel.searchMessages(with: newValue)
                        })
                        .animation(.easeIn(duration: 0.20), value: isEditting)
                        
                    if isEditting {
                        Button {
                            searchText = ""
                            isEditting = false
                            self.endEditing()
                        } label: {
                            Text("cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.20), value: isEditting)
                    }
                }
                
                Spacer().frame(height: 14)
             
                ZStack {
                    VStack{
                        ForEach(messageListViewModel.filteredMessagePreview){ messagePreview in
                            
                            NavigationLink {
                                ChatView(person: messagePreview.person)
                            } label: {
                                MessageRowView(messagePreview: messagePreview)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .animation(.easeIn(duration: 0.25), value: messagePreview.lastMessage)
                            .transition(.slide)
                        }
                    }
                    if isEditting && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                    
                    
                }
                Spacer()
            }
        }
        .modifier(HideNavigationView())
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MessageListView()
        }
    }
}
