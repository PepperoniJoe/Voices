//
//  Voices.swift
//  Voices
//
//  Created by Marcy Vernon on 5/20/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import Foundation
import AVFoundation

struct VoiceLanguageList {
    
    var voices = [(voiceCode: String, voiceDescription: String)]()
    
    //Create Array for PickerView
    mutating func showAllVoices() {
        
        var tempVoices = [(voiceCode: String, voiceDescription: String)]()
        var voiceWithSpeakerName = String()
        
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            
            let language = lookupSpeakers[voice.language] ?? "unknown"
            if language == "unknown" {
                print("Add \(voice.language) to dictionary for \(voice.name)")
            }
            voiceWithSpeakerName = language + "-" + voice.name
            tempVoices.append((voice.identifier, voiceWithSpeakerName))
            
            voices = tempVoices.sorted { $0.1 < $1.1 }
        }
    }
    
    
  //Dictionary to translate identifier into language and country
  let lookupSpeakers : [String : String] = [
    "ar-SA" : "Arabic-Saudi Arabia",
    "zh-CN" : "Chinese-China",
    "zh-HK" : "Chinese-Hong Kong",
    "zh-TW" : "Chinese-Taiwan",
    "cs-CZ" : "Czech",
    "da-DK" : "Danish-Denmark",
    "nl-BE" : "Dutch-Belgian",
    "nl-NL" : "Dutch-Netherlands",
    "de-DE" : "German",
    "el-GR" : "Greek",
    "en-AU" : "English-Australia",
    "en-GB" : "English-Great Britain",
    "en-IE" : "English-Ireland",
    "en-IN" : "English-India",
    "en-ZA" : "English-South Africa",
    "en-US" : "English-USA",
    "fi-FI" : "Finnish",
    "fr-CA" : "French-Canada",
    "fr-FR" : "French-France",
    "he-IL" : "Hebrew",
    "hi-IN" : "Hindi",
    "hu-HU" : "Hungarian",
    "id-ID" : "Indonesian",
    "it-IT" : "Italian",
    "ja-JP" : "Japanese",
    "ko-KR" : "Korean",
    "no-NO" : "Norwegian",
    "pl-PL" : "Polish",
    "pt-BR" : "Portugese-Brazil",
    "pt-PT" : "Portugese-Portugal",
    "ro-RO" : "Romanian",
    "ru-RU" : "Russian",
    "sk-SK" : "Slovakian",
    "es-MX" : "Spanish-Mexico",
    "es-ES" : "Spanish-Spain",
    "sv-SE" : "Swedish",
    "th-TH" : "Thai",
    "tr-TR" : "Turkish"
  ]
}

