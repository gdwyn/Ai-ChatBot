//
//  ChatOptions.swift
//  AiChatBot
//
//  Created by Godwin IE on 08/12/2023.
//

import SwiftUI

struct ChatOptions: View {
    var isLong : Bool
    var title : String
    var color : Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Circle()
                    .frame(width: 44)
                    .foregroundColor(color)
                //.padding(.horizontal, 14)
                
                Spacer()
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 14) {
                
                if isLong {
                    HStack{
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.green)
                        Text("Live chat")
                            .font(.callout)
                            .foregroundStyle(.black.opacity(0.5))
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(.white)
                    .clipShape(Capsule())

                }
                
                Text(title)
                    .font(.callout)
                    .frame(width: 100)
                    .padding(.horizontal, -14)
                
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 22)
        .padding(.horizontal, 14)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 24)))
    }
}

#Preview {
    ChatOptions(isLong: false, title: "Talk with Chap", color: .green)
}
