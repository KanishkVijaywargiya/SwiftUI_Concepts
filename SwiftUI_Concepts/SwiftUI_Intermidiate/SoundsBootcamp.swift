//
//  SoundsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/02/22.
//

import SwiftUI
import AVKit

class SoundManager {
    // Singleton class -> creating a single instance of soundManager
    // created once for entire app. instead of initializing a new one for every screen.
    static let soundManager = SoundManager()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badam
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                SoundManager.soundManager.playSound(sound: .tada)
            }) {
                Text("Play Sound 1")
            }
            Button(action: {
                SoundManager.soundManager.playSound(sound: .badam)
            }) {
                Text("Play Sound 2")
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
