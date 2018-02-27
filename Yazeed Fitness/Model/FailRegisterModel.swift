


//
//  FailRegisterModel.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 11/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class FailRegisterModel : NSObject
{
    
    
    var error : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        
        if dictionary ["name"] as? [String] != nil {
         error = ( ((dictionary ["name"] as? [String]!)?[0])!)
        }
        else if dictionary ["age"] as? [String] != nil {
            error = ( ((dictionary ["age"] as? [String]!)?[0])!)
        }
        else if dictionary ["email"] as? [String] != nil {
            error = ( ((dictionary ["email"] as? [String]!)?[0])!)
        }
        else if dictionary ["height"] as? [String] != nil {
            error =  (((dictionary ["height"] as? [String]!)?[0])!)
        }
        else if dictionary ["ideal_weight"] as? [String] != nil {
            error =  (((dictionary ["ideal_weight"] as? [String]!)?[0])!)
        }
        else if dictionary ["current_weight"] as? [String] != nil {
            error = ( ((dictionary ["current_weight"] as? [String]!)?[0])!)
        }
        else if dictionary ["password"] as? [String] != nil {
            error = ( ((dictionary ["password"] as? [String]!)?[0])!)
        }
        else if dictionary ["image"] as? [String] != nil {
            error = ( ((dictionary ["image"] as? [String]!)?[0])!)
        }
        else if dictionary ["deviceToken"] as? [String] != nil {
            error =  (((dictionary ["deviceToken"] as? [String]!)?[0])!)
        }

    }
    
    
}
