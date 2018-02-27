//
//  AboutModel.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class AboutModel{
    var discription: String!
    var linkedin: String!
    var instagram: String!
    var behance: String!
    var pinterest: String!
    var snap:  String!
    
    init(fromDictionary dictionary: [String:Any]){
        discription = dictionary["description"] as? String
        linkedin = dictionary["linkedin"] as? String
        instagram = dictionary["instgram"] as? String
        behance = dictionary["behance"] as? String
        pinterest = dictionary["beinterest"] as? String
        snap = dictionary["snap"] as? String
        
    }

}
