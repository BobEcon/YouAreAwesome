//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Robert Beachill on 25/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = "I Am A Programmer!"
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
//                .foregroundStyle(.red)
            Spacer()
            
            HStack {
                Button("Awesome") {
                    message = "Awesome!"
                }
                
                Button("Great") {
                    message = "Great!"
                }
        
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
