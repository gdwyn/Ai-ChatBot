//
//  SpeechOrbAnimation.swift
//  AiChatBot
//
//  Created by Godwin IE on 01/12/2023.
//

import SwiftUI

struct SpeechOrbAnimation: View {
        @State private var borderWidth: CGFloat = 3
        @State private var timer: Timer?
        @State private var rotation: CGFloat = 0

        var body: some View {
           Circle()
                .stroke(Gradient(colors: [Color.blue, Color.purple, Color.purple]), lineWidth: borderWidth)
                .rotationEffect(.degrees(rotation))
                .blur(radius: 1)
                .offset(x: 4, y: 6)
                .shadow(color: .white, radius: 5)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: borderWidth * 3)
                        .blur(radius: 4)
                   )
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: borderWidth)
                        .stroke(Color.white, lineWidth: borderWidth * 3)
                        .blur(radius: 12)
                        .foregroundColor(.white)
                    )
           
               .onAppear {
                   self.timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
                       withAnimation(.linear(duration: 0.7)) {
                           self.borderWidth = self.borderWidth == 3 ? 10 : 3
                           
                           
                           
                           
                           self.rotation += 360
                       }
                   }
               }
               .onDisappear {
                   self.timer?.invalidate()
               }
       }
}

#Preview {
    SpeechOrbAnimation()
}
