//
//  UIExtentions.swift
//  Brands
//
//  Created by MAC on 3/5/17.
//  Copyright © 2017 Mohamed Hashem. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIView

extension UIView {
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    
    var height : CGFloat {
        get {
            return self.frame.size.height
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    
    func fadeIn(withDuration duration: TimeInterval = 3.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func setLayoutStyle(borderColor: UIColor, borderWidth: Float, cornerRaduis: Float?) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        (cornerRaduis != nil) ? (self.layer.cornerRadius = CGFloat(cornerRaduis!)) : ()
        self.layer.masksToBounds = true
    }
    func UpShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.layer.shadowRadius = 5
    }
    func dropShadow ()
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 5
    }
    
    func dropShadowWith(radius: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = CGFloat(radius)
    }
    
    
    func borderRad(Radus:CGFloat,borderWidth:CGFloat,BorderColor:UIColor? = nil)
    {
        layer.borderWidth = borderWidth
        layer.cornerRadius = Radus
        clipsToBounds = true;
        if let BorderColor = BorderColor
        {
            layer.borderColor = BorderColor.cgColor;
        }
        
    }

    
    func drawBorderWith(color: UIColor?, width: Float?, cornerRadius: Float? ) {
        
        (color != nil) ? (self.layer.borderColor = color?.cgColor) : ()
        (width != nil) ? (self.layer.borderWidth = CGFloat(width!)) : ()
        (cornerRadius != nil) ? (self.layer.cornerRadius = CGFloat(cornerRadius!)) : ()
        
    }
    func loadViewFromNib(xibName: String) -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: xibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
      
}


// MARK: - UIButton - 

extension UIButton {
    
    func underlineButton(text: String) {
        let titleString = NSMutableAttributedString(string: text)
        titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0, text.characters.count))
        self.setAttributedTitle(titleString, for: .normal)
    }
}



// MARK: - UIApplication

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}


extension Double {
    func toString() -> String {
        return String(format: "%.f",self)
    }
}


extension String {
    
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

