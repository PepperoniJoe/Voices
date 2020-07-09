//
//  VoiceSynthesizer.swift
//  Voices
//
//  Created by Marcy Vernon on 5/20/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import AVFoundation

class Voice {
  
  let synth  = AVSpeechSynthesizer()
  var speech = AVSpeechUtterance(string: String())
  
  func say(speaker: String, phrase: String, rate: Float, pitch: Float) {
    speech = AVSpeechUtterance(string: phrase)
    speech.rate = rate // 0.5 default
    speech.pitchMultiplier = pitch // 0.9 // [0.5 - 2] Default = 1
    speech.voice = AVSpeechSynthesisVoice(identifier: speaker)
    synth.speak(speech)
  }
  
  func stop() {
    synth.stopSpeaking(at: .immediate)
  }
}
