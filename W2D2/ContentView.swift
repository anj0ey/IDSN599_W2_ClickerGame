//
//  ContentView.swift
//  W2D2
//
//  Created by Anjo on 9/4/25.
//

// I created a clicker game where the goal is to tap on the coin to collect more coins. Every 10
// coins, the user is alerted with a reward that tells them to continue clicking.

import SwiftUI

struct ContentView: View {
    @State var isOn = false
    @State var numClick = 0
    @State var achievementMessage: String? = nil
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Tap below for free coins")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }.padding()
            
            VStack(spacing: 20) {
                Text("Coins: \(numClick)")
                    .font(.largeTitle)
            }
            
            Button("🪙") {
                onClick()
            }.font(.system(size: 200))
            
            if let message = achievementMessage {
                Text(message)
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }.padding()
    }
    
    func onClick() {
        numClick += 1
        print(numClick)

        achievementMessage = achievement(numClick: numClick)
    }
    
    func achievement(numClick: Int) -> String? {
        if numClick % 10 == 0 {
            return "🎉 Another 10 coins! Great job, keep on clicking!"
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}
