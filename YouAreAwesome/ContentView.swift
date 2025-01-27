//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Robert Beachill on 25/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""
    @State private var imageName: String = ""
    @State private var imageNumber = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)

            Spacer()
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                
                imageName = "image" + String(imageNumber)
                message = message == message1 ? message2 : message1
                
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
