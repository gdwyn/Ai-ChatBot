//
//  Home.swift
//  AiChatBot
//
//  Created by Godwin IE on 01/12/2023.
//

import SwiftUI

struct HomeView: View {
    let buddies = ["Nexus", "Synth", "Quasar", "Zenith", "Spark", "Sage"]
    @State private var buddySize : CGFloat = 100
    @State private var selectedBuddyIndex = 0
    
    var selectedBuddy: String {
            buddies[selectedBuddyIndex]
        }
    
    var body: some View {
        
        NavigationView {

        VStack (alignment: .leading, spacing: 24) {
           
                HStack{
                    VStack(alignment: .leading){
                        Rectangle()
                            .frame(width: 28, height: 2)
                        
                        Rectangle()
                            .frame(width: 36, height: 2)
                    }
                    
                    Spacer()
                    
                    Image("profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.kGray, lineWidth: 1)
                        )
                }
                .padding()
                // Hi there and image
                
                Text("""
                Select
                your buddy
                """)
                .font(.largeTitle)
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(buddies.indices, id: \.self) { index in
                            Button {
                                withAnimation() {
                                    selectedBuddyIndex = index
                                }
                            } label: {
                                VStack(spacing: 12) {
                                    Image(buddies[index])
                                        .resizable()
                                        .frame(width: (selectedBuddyIndex == index) ? 120 : 90, height: (selectedBuddyIndex == index) ? 120 : 90)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 26, height: 10)))
                                    Circle()
                                        .frame(width: 6)
                                        .foregroundColor(selectedBuddyIndex == index ? .black : .clear)
                                    
                                }
                            }
                        }
                        
                    }
                    .frame(height: 180)
                    .padding(.horizontal)
                    .padding(.bottom, 18)
                }
                // buddies scroll view
                
                HStack(spacing: 14){
                    NavigationLink {
                        ChatView(buddy: selectedBuddy)
                    } label: {
                        ChatOptions(isLong: true, title: 
                                    """
                                    Talk with
                                    \(selectedBuddy)
                                    """,
                                    color: .kBlue, icon: "mic.fill")
                    }
                    
                    VStack(spacing: 14) {
                        ChatOptions(isLong: false, title: 
                                    """
                                    Chat with
                                    \(selectedBuddy)
                                    """,
                                    color: .kGray, icon: "text.bubble.fill")
                        
                        ChatOptions(isLong: false, title:
                                    """
                                    Ai Image search
                                    """,
                                    color: .kPink, icon: "wand.and.stars.inverse")
                    }
                }
                .padding(.horizontal)
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)

            }
        }
    }
}

#Preview {
    HomeView()
}
