//
//  Styles.swift
//  Mahir_Client
//
//  Created by Mohamed Hashem on 4/30/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import  UIKit

class styles
{
    static func BorderRad(targets:UIView ...,Radus:CGFloat,borderWidth:CGFloat,BorderColor:UIColor? = nil,corners:UIRectCorner? = nil)
    {
        for target:UIView in targets
        {
            target.layer.borderWidth = borderWidth
            target.layer.cornerRadius = Radus
            target.clipsToBounds = true;
            if let BorderColor = BorderColor
            {
                target.layer.borderColor = BorderColor.cgColor;
            }
//            let corners_ : UIRectCorner = corners ?? ([ UIRectCorner.topLeft, .bottomLeft, .bottomRight,.topRight])
//            
//            let maskPath = UIBezierPath(roundedRect: target.bounds, byRoundingCorners: corners_, cornerRadii:  CGSize(width: CGFloat(Radus), height: CGFloat(Radus)))
//            let mask = CAShapeLayer(layer: target.layer)
//            mask.frame = target.frame
//            mask.path = maskPath.cgPath
//            target.layer.mask = mask;
        }
    }
    static func fontFrom(name:String,size:CGFloat) -> UIFont? { // traits:UIFontDescriptorSymbolicTraits = .traitUIOptimized
//         let disciptor = UIFontDescriptor(name: FontFamily, size: size).withSymbolicTraits(traits)
//           return UIFont(descriptor: disciptor, size: size)
        let newFont = UIFont(name: name, size: size)
        return newFont

        
    }
}


