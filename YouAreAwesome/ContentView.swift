//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Robert Beachill on 25/01/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message: String = ""
    @State private var imageName: String = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber: Int = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages: Int = 10
    let numberOfSounds: Int = 6
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            

            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messages = ["You are Awesome!",
                                    "When the Genius Bar Needs help, They Call You!",
                                    "You are Great!",
                                    "You are Fantastic!",
                                    "Fabulous? That's You!",
                                    "You Make Me smile!",
                    ]
// It works here too
//                    if audioPlayer != nil && audioPlayer.isPlaying {
//                        audioPlayer.stop()
//                    }
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image" + String(lastImageNumber)
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound" + String(lastSoundNumber))
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else
        {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer =  try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print(" 😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview {
    ContentView()
}
