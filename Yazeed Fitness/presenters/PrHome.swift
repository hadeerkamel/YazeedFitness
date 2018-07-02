//
//  PrHome.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 18/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrHome{
    //MARK: DalCallers
    static func SearchDoctors(specialty:String , callBack: @escaping (_ success: Bool,_ message: String,_ doctors:Doctors?)->()){
        DalDoctors.SearchDoctors(userToken:PrLogin.UserToken,specialty: specialty){   (responseState, message, doctors) in
            
            if responseState == .Success{
                callBack(true ,"",doctors)
            }else{
                callBack(false ,message,nil)
            }
            
            
        }
    }
    static func updateWeight(newWeight:String,callBack: @escaping (_ success: Bool,_ message: String)->()){
    
        DalLogin.updateWeight(userToken: PrLogin.UserToken, newWeight: newWeight){
            (responseState,message) in
            if responseState == .Success {
                callBack(true,message)
            }else{
                callBack(false,message)
            }
        
        }
    }
}
