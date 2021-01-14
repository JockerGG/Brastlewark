//
//  UIView.swift
//  Brastlewark
//
//  Created by Eduardo García on 14/01/21.
//

import Foundation
import UIKit

extension UIView {
    
    func toCircle() {
        self.layer.mask?.masksToBounds = false
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.mask?.masksToBounds = false
    }
    
    func setBorder(width: CGFloat, color: UIColor?) {
        self.layer.borderWidth = width
        
        guard let color = color else { return }
        self.layer.borderColor = color.cgColor
    }
}
