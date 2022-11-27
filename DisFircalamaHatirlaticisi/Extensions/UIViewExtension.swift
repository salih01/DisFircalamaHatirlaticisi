//
//  UIViewExtension.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 26.11.2022.
//

import UIKit

extension UIView {
    
  @IBInspectable  var cornerRadius:CGFloat {
        
        
        get { return cornerRadius }
        set {self.layer.cornerRadius = newValue }
    }
    
}
