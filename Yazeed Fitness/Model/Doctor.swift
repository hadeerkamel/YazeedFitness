//
//  Doctor.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 18/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class Doctor{
    var id: Int!
    var name: String!
    var specialty: String!
    var mobile: String!
    var photo:String!
    
     init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        specialty = dictionary["speciality"] as? String
        mobile = dictionary["mobile"] as? String
        photo = dictionary["photo"] as? String
    }
}
class Doctors{
    var doctors: [Doctor]! = []
    init(fromArrayDictionary array: [[String:Any]]){
       
        for item in array {
            doctors.append(Doctor(fromDictionary: item))
        }
    }
}
