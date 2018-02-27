//
//  AuthentcationModel.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 11/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class AuthentcationModel : NSObject
{
    
    var userToken : String!
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        userToken = dictionary["userToken"] as? String
}

}
