//
//  Ext-UIView.swift
//  Voices
//
//  Created by Marcy Vernon on 7/8/20.
//  Copyright © 2020 Marcy Vernon. All rights reserved.
//

import UIKit

extension UIView {
  func setRadius(radius: CGFloat? = nil) {
    self.layer.cornerRadius = radius ?? self.frame.width / 2
    self.layer.masksToBounds = true
  }
}
//   image.setRadius(radius: CGFloat(15.0)) // Square with Round Corners
//   image.setRadius() // Circle
