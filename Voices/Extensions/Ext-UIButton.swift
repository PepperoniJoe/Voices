//
//  Ext-UIButton.swift
//  Voices
//
//  Created by Marcy Vernon on 7/8/20.
//  Copyright © 2020 Marcy Vernon. All rights reserved.
//

import UIKit

extension UIButton {
  func roundButton(radius: CGFloat? = nil) {
    self.layer.cornerRadius = radius ?? self.frame.width / 2
    self.clipsToBounds = true
  }
}
