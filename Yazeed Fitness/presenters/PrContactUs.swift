//
//  PrContactUs.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 23/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrContactUs{
    static func ContactUs(subject:String,messageBody:String,callback:@escaping(_ Sucess:Bool,_ Message:String)->()){
        DalContactUs.ContactUs(userToken: PrLogin.UserToken, subject: subject, message: messageBody){
            (responseState ,message) in
            if responseState == .Success{
                callback(true ,message)
            }else{
                callback(false ,message)
            }
        }
        
    }
}
