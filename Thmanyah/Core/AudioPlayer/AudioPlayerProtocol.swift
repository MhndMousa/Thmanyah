//
//  AudioPlayerProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Combine

protocol AudioPlayerProtocol{
    var currentTrackId: String? { get }
    var isPlaying: Bool { get }
    var queue: [String] { get set }
    
    func play()
    func pause()
    func nextTrack()
    func previousTrack()
    func addToQueue(_ trackId: String)
}
