//
//  DepImages.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DepImage{
    var id: Int!
    var image: String!
    var model: String!
    var modelID: String!
    var createdAt: String!
    var updatedAt:String!
    
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String
        model = dictionary["model"] as? String
        modelID = dictionary["model_id"] as? String
        createdAt = dictionary["created_at"] as? String
        updatedAt = dictionary["updated_at"] as? String
    }

}
class DepImages{
    var array:[DepImage]! = []
    init(fromArrayDictionary arrayDictionary: [[String:Any]]){
        for item in arrayDictionary {
            array.append(DepImage(fromDictionary: item))
        }
    }
}
