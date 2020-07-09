//
//  ViewController.swift
//  Voices
//
//  Created by Marcy Vernon on 5/20/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit
//import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var imageviewBanner:   UIImageView!
  @IBOutlet weak var buttonClear:       UIButton!
  @IBOutlet weak var textPhrase:        UITextView!
  @IBOutlet weak var textPitch:         UITextField!
  @IBOutlet weak var textRate:          UITextField!
  @IBOutlet weak var labelChoiceVoice:  UILabel!
  @IBOutlet weak var pickerVoice:       UIPickerView!
  @IBOutlet weak var buttonSpeaker:     UIButton!

  var voiceList = VoiceLanguageList()
  let voice     = Voice()
  var speaker   = String()
  
  //MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // delegate for textView
    textPhrase.delegate = self
   // textRate.delegate = self as? UITextFieldDelegate
    
    // UI appearance
    updateUI()

    // gets list of all available voices for the device
    voiceList.showAllVoices()
    
    //sets default voice
    labelChoiceVoice.text = "English-Great Britain-Daniel"
    speaker = "com.apple.ttsbundle.Daniel-compact"
    pickerVoice.selectRow(14, inComponent: 0, animated: true)
  }

  // Update the UI elements
  override var prefersStatusBarHidden: Bool {
    return true
  }
  

  func updateUI() {
    imageviewBanner.setRadius(radius: 15.0)
    textPhrase.setRadius(radius: 15.0)
    textPitch.setRadius(radius: 10.0)
    textRate.setRadius(radius: 10.0)
    buttonSpeaker.roundButton(radius: 15.0)
  }

  
  //MARK: Speak button
  //If pressed, will stop any speech currently being played.
  @IBAction func sayText(_ sender: Any) {
    voice.stop()
    
    let phrase       = textPhrase.text != nil     ? textPhrase.text!     : String()
    let enteredPitch = textPitch.text != nil      ? textPitch.text!      : "1.0"
    let pitch        = Float(enteredPitch) != nil ? Float(enteredPitch)! : Float(1.0)
    let enteredRate  = textRate.text != nil       ? textRate.text!       : "0.5"
    let rate         = Float(enteredRate) != nil  ? Float(enteredRate)!  : Float(0.5)
    textPitch.text   = enteredPitch
    textRate.text    = enteredRate
    
    voice.say(speaker: speaker, phrase: phrase, rate: rate, pitch: pitch)
  }
  
  //MARK: -
  // TextView functions
  var textViewClearedOnInitialEdit = false
  
  func textViewDidBeginEditing(_ textView: UITextView) {
   // textPhrase.text = ""
    buttonClear.isHidden = false
  }
  
  @IBAction func clearPhrase(_ sender: Any) {
    textPhrase.text = String()
  }
  
//  @IBAction func dismissKeyboard(_ sender: Any) {
//    self.view.endEditing(true)
//    buttonClear.isHidden = true
//  }

  
  // Assist with keyboard dismiss
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    buttonClear.isHidden = true
  }
  

} //end of ViewController

//MARK: -  UITextViewDelegate
extension ViewController: UITextViewDelegate {
    
}


//MARK: -  UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      labelChoiceVoice.text = voiceList.voices[row].voiceDescription
      labelChoiceVoice.textColor = UIColor.white
      labelChoiceVoice.alpha = 1.0
      speaker = voiceList.voices[row].voiceCode
    }
    
}


//MARK: -  UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return voiceList.voices[row].voiceDescription
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
      return CGFloat(372.0)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return CGFloat(36.0)
    }
    
     func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
       
       // format label background
       let pickerLabel = UILabel()
       let hue = CGFloat(row)/CGFloat(voiceList.voices.count)
       pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 0.75, alpha: 1.0)
       
       // format title
       let titleAttributes = [
         .foregroundColor : UIColor.white,
         .font            : UIFont.boldSystemFont(ofSize: 20)
         ] as [NSAttributedString.Key : Any]
       
       let myTitle = NSAttributedString(string: voiceList.voices[row].voiceDescription, attributes: titleAttributes)
       
       // add new title to label
       pickerLabel.attributedText = myTitle
       pickerLabel.textAlignment = .center
       return pickerLabel
     }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return voiceList.voices.count
    }
    
}

