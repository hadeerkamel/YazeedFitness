//
//  ModBaseResponse.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/25/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation

import Foundation

class ModBaseResponse
{
    var code:Int? = nil;
    var status:String? = nil
    var message:Any? = nil
    var ResponseStat:ResponseStat!
    
    var FullResponse : [String:Any]!
    
    
    func Populate(dictionary:[String:Any]) {
        code = dictionary["code"] as? Int
        status = dictionary["status"] as? String
        message = dictionary["message"]
        FullResponse = dictionary
    }
    
    class func Populate(dictionary:[String:Any]) -> ModBaseResponse
    {
        let result = ModBaseResponse()
        result.Populate(dictionary: dictionary)
        return result
    }
    
}
