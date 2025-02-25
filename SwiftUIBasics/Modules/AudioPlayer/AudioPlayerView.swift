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
    @State private var isPlaying = false
    @State private var songs = [
        "song1",
        "song2",
        "song3"
    ]
    @State private var title = ""
    @State private var albums = ["album1", "album2", "album3"]
    @State private var album = ""
    @State private var currentSong = 0
    @State private var progress: CGFloat = 0
    
    func goForwardSong() {
        audioPlayer?.stop()
        
        if songs.count - 1 != currentSong {
            currentSong += 1
            playSong()
            audioPlayer?.play()
            
            title = songs[currentSong]
            album = albums[currentSong]
        }
    }
    
    func goBackwardSong() {
        audioPlayer?.stop()
        
        if currentSong > 0 {
            currentSong -= 1
            playSong()
            audioPlayer?.play()
            
            title = songs[currentSong]
            album = albums[currentSong]
        }
    }
    
    func playSong() {
        if let song = Bundle.main.path(forResource: songs[currentSong], ofType: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: song))
                audioPlayer?.prepareToPlay()
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [
                    .mixWithOthers,
                    .allowAirPlay
                ])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(album)
                    .cornerRadius(12)
                
                Text(title)
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.5)
                        .frame(width: 320, height: 8)
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(width: progress, height: 8)
                        .gesture(DragGesture()
                            .onChanged({ value in
                                if value.location.x >= 0 && value.location.x <= 320 {
                                    self.progress = value.location.x
                                }
                            }).onEnded({ value in
                                let x = value.location.x
                                let screen = UIScreen.main.bounds.width - 32
                                let percentage = x / screen
                                
                                if let  audioPlayer = audioPlayer {
                                    audioPlayer.currentTime = Double(percentage) * audioPlayer.duration
                                }
                            })
                        )
                }
                
                HStack {
                    Button {
                        goBackwardSong()
                        isPlaying = true
                    } label: {
                        Image(systemName: "backward.fill")
                    }
                    .modifier(MultimediaButton())
                    
                    Button {
                        isPlaying.toggle()
                        if isPlaying {
                            audioPlayer?.play()
                        } else {
                            audioPlayer?.pause()
                        }
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    }
                    .modifier(MultimediaButton())
                    
                    Button {
                        goForwardSong()
                        isPlaying = true
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .modifier(MultimediaButton())
                }
            }
        }
        .onAppear {
            playSong()
            
            title = songs[currentSong]
            album = albums[currentSong]
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
                    let screen = UIScreen.main.bounds.width - 32
                    let value = audioPlayer.currentTime / audioPlayer.duration
                    progress = screen * CGFloat(value)
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
