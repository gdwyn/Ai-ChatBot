//
//  Home.swift
//  AiChatBot
//
//  Created by Godwin IE on 01/12/2023.
//

import SwiftUI

struct HomeView: View {
    let buddies = ["buddy1", "buddy2", "buddy3", "buddy4", "buddy5", "buddy6"]
    @State private var buddySize : CGFloat = 100
    @State private var selectedBuddyIndex = 0
    
    var selectedBuddy: String {
            buddies[selectedBuddyIndex]
        }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24) {
           
            HStack{
                VStack(alignment: .leading){
                    Rectangle()
                        .frame(width: 28, height: 2)
                    
                    Rectangle()
                        .frame(width: 36, height: 2)
                }
                
                Spacer()
                
                Circle()
                    .frame(width: 50)
                    .foregroundColor(.gray)
            }
            .padding()
            // Hi there and image
            
            Text("Select your buddy")
                .font(.largeTitle.bold())
                .frame(width: 200)
                .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(buddies.indices, id: \.self) { index in
                        let buddy = buddies[index]
                        Button {
                            withAnimation() {
                                selectedBuddyIndex = index
                            }
                        } label: {
                            VStack(spacing: 14) {
                                Circle()
                                    .frame(width: (selectedBuddyIndex == index) ? 120 : 90)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 8)
                                    .foregroundColor(selectedBuddyIndex == index ? .black : .clear)
                            }
                        }
                    }

                }
                .padding(.horizontal)
                .padding(.vertical, 32)
            }
            // buddies scroll view
            
            HStack(spacing: 14){
                ChatOptions(isLong: true, title: "Talk with \(selectedBuddy)", color: .blue)
                VStack(spacing: 14) {
                    ChatOptions(isLong: false, title: "Chat with \(selectedBuddy))", color: .green)
                    ChatOptions(isLong: false, title: "Ai Image search", color: .purple)
                }
            }
            .padding(.horizontal)
    
        }
    }
}

#Preview {
    HomeView()
}
