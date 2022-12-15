//
//  UIViewExtension.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 26.11.2022.
//

import UIKit

extension UIView {
    
    /*

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
    */
    
      
    @IBInspectable  var cornerRadius:CGFloat {
          
          get { return cornerRadius }
          set {self.layer.cornerRadius = newValue }
      }
      
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }
      
  
}
