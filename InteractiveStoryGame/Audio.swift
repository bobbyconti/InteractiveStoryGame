//
//  Audio.swift
//  InteractiveStoryGame
//
//  Created by Bobby Conti on 4/12/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import Foundation
import AudioToolbox

// Extending Story to associate sound effects with each story
extension Story {
    var soundEffectName: String {
        switch self {
        case .droid, .home: return "HappyEnding"
        case .monster: return "Ominous"
        default: return "PageTurn"
        }
    }
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        
        return URL(fileURLWithPath: path)
    }
}

// Plays sound effects for a particular story
class SoundEffectsPlayer {
    var sound: SystemSoundID = 0        // Stores the byte representation of sound effect
    
    func playSound(for story: Story) {
        let soundURL = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)      // Pass by reference, using less memory
        AudioServicesPlaySystemSound(sound)
    }
}
