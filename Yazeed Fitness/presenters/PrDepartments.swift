//
//  PrDepartments.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrDepartments{
    static func getDepartments(callBack: @escaping(_ succcess:Bool ,_ message:String ,_ deps:Departments?)->()){
        DalDepartments.getDepartments(userToken:PrLogin.UserToken){
            (responseState ,mess ,depsList) in
            if responseState == ResponseStat.Success{
                callBack(true , mess ,depsList)
            }else{
                callBack(false , mess ,nil)
            }
        }
    }
}
