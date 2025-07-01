//
//  AudioPlayer.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Combine

class AudioPlayer: AudioPlayerProtocol {
    @Published var currentTrackId: String?
    @Published var isPlaying: Bool = false
    var queue: [String]
    
    init(currentTrackId: String? = nil, isPlaying: Bool = false, queue: [String]) {
        self.currentTrackId = currentTrackId
        self.isPlaying = isPlaying
        self.queue = queue
    }
    
    func play() {}
    func pause() {}
    func nextTrack() {}
    func previousTrack() {}
    func addToQueue(_ trackId: String) {
        queue.append(trackId)
    }
    
}
