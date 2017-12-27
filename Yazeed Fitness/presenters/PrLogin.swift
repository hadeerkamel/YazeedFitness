//
//  PrLogin.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation

class PrLogin {
    
    open class func shared() -> PrLogin
    {
        struct Static {
            //Singleton instance. Initializing classname
            
            static let shared = PrLogin()
        }
        /** @return Returns the default singleton instance. */
        return Static.shared
    }
    
    
    
    
}
