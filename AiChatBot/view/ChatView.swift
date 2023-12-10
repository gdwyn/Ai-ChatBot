//
//  ChatView.swift
//  AiChatBot
//
//  Created by Godwin IE on 08/12/2023.
//

import SwiftUI

struct ChatView: View {
    @State private var isListening = false
    @Environment(\.presentationMode) var presentationMode

    var buddy : String

    var body: some View {
            VStack (spacing: 32) {
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(buddy)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 18, height: 10)))
                        Text(buddy)
                            .font(.callout)
                            .foregroundStyle(.gray)
                            
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                    
                }
                //top row
                
                if isListening {
                    Color.clear
                        .frame(height: 54)
                } else {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
                Text("Hey buddy! What's the scoop?")
                    .font(isListening ? .footnote : .title)
                    .foregroundStyle(isListening ? .clear : .kGray)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 24) {
                    SpeechOrbAnimation()
                        .frame(width: isListening ? 140 : 0, height: isListening ? 130 : 0)
                    
                    Text("I'm listening")
                        .font(.title3)
                        .foregroundStyle(isListening ? .kGray : .clear)
                }
                
                Spacer()
                
                
                Button{
                    
                    withAnimation{
                        if isListening {
                            isListening = false
                        } else {
                            isListening = true
                        }
                        
                    }
                } label: {
                    Image(systemName: isListening ? "xmark" : "mic.fill")
                        .font(.title)
                        .foregroundStyle(isListening ? .kGray : .kBlue)
                        .padding(26)
                        .background(
                            Circle()
                                .foregroundColor(isListening ? .kGray.opacity(0.1) : .kBlue.opacity(0.1))
                        )
                }
                
            }
            .padding()
            .navigationBarItems(leading: EmptyView())
            .navigationBarHidden(true)
    }
}

#Preview {
    ChatView(buddy: "Sage")
}
