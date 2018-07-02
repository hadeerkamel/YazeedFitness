//
//  PrDoctors.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 24/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrDoctors{
    
    static func getDoctors( callBack: @escaping (_ success: Bool,_ message: String,_ doctors:Doctors?)->()){
        DalDoctors.getDoctors(userToken:PrLogin.UserToken){   (responseState, message, doctors) in
            if responseState == .Success{
                callBack(true ,"",doctors)
            }else{
                callBack(false ,message,nil)
            }
            
            
        }
        
    }
}
