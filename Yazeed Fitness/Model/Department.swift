//
//  Department.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class Department {
    var id: Int!
    var title: String!
    var description: String!
    var shortDescription: String!
    var icon: String!
    var coverImage:String!
    
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        icon = dictionary["icon"] as? String
        coverImage = dictionary["cover_image"] as? String
        shortDescription = dictionary["short_description"] as? String
    }
}
class Departments{
    var array:[Department]! = []
    init(fromArrayDictionary arrayDictionary: [[String:Any]]){
        for item in arrayDictionary {
            array.append(Department(fromDictionary: item))
        }
    }
}
