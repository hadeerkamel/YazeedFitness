//
//  UserEntity.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation

class UserEntity {
    var name: String!
    var email: String!
    var age: String!
    var height: String!
    var registerdWeight: String!
    var currentWeight: String!
    var idealWeight:  String!
    var image: String!
    
    
    init(fromDictionary dictionary: [String:Any]){
        name = dictionary["name"] as? String
        email = dictionary["email"] as? String
        age = dictionary["age"] as? String
        height = dictionary["height"] as? String
        registerdWeight = dictionary["registered_weight"] as? String
        currentWeight = dictionary["current_weight"] as? String
        idealWeight = dictionary["ideal_weight"] as? String
        image = dictionary["image"] as? String
    }
    
}
