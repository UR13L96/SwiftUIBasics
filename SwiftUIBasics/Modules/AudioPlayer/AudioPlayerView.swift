//
//  AudioPlayerView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 20/02/25.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Audio Player")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "backward.fill")
                    }
                    .modifier(MultimediaButton())
                    
                    Button {
                        audioPlayer?.play()
                    } label: {
                        Image(systemName: "play.fill")
                    }
                    .modifier(MultimediaButton())
                    
                    Button {
                        audioPlayer?.pause()
                    } label: {
                        Image(systemName: "pause.fill")
                    }
                    .modifier(MultimediaButton())
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .modifier(MultimediaButton())
                }
            }
        }
        .onAppear {
            if let song = Bundle.main.path(forResource: "song1", ofType: "wav") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: song))
                    audioPlayer?.prepareToPlay()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MultimediaButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .font(.largeTitle)
            .padding(16)
    }
}

#Preview {
    AudioPlayerView()
}
