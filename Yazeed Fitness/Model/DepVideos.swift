//
//  DepVideos.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DepVideo{
    var id: Int!
    var depId: String!
    var url: String!
    var createdAt: String!
    var updatedAt:String!
    var thumbnail: String!
    
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        depId = dictionary["department_id"] as? String
        url = dictionary["url"] as? String
        createdAt = dictionary["created_at"] as? String
        updatedAt = dictionary["updated_at"] as? String
        thumbnail = dictionary["video_thumbnail"] as? String
    }
    
}
class DepVideos{
    var array:[DepVideo]! = []
    init(fromArrayDictionary arrayDictionary: [[String:Any]]){
        for item in arrayDictionary {
            array.append(DepVideo(fromDictionary: item))
        }
    }
}
