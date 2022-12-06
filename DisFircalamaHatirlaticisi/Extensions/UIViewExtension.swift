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
    
    
    @IBInspectable var shadow: CGSize {
        
        get { return shadow}
        set { self.layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowOpacity : Float {
        
        get { return shadowOpacity}
        set { self.layer.shadowOpacity = 0.3 }
    }
    
    
  
}
