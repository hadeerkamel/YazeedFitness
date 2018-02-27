//
//  PrDepsDetails.swift
//  Yazeed Fitness
//
//  Created by Haadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrDepsDetails{
    static func getDepImages(depID:Int,callBack: @escaping(_ succcess:Bool ,_ message:String ,_ depImages:DepImages?)->()){
        DalDepartments.getDepImages(userToken:PrLogin.UserToken , depID: depID){
            (responseState ,mess ,depImagesList) in
            if responseState == ResponseStat.Success{
                callBack(true , mess ,depImagesList)
            }else{
                callBack(false , mess ,nil)
            }
        }
    }
    static func getDepVideos(depID:Int,callBack: @escaping(_ succcess:Bool ,_ message:String ,_ depImages:DepVideos?)->()){
        DalDepartments.getDepVideos(userToken:PrLogin.UserToken , depID: depID){
            (responseState ,mess ,depVideosList) in
            if responseState == ResponseStat.Success{
                callBack(true , mess ,depVideosList)
            }else{
                callBack(false , mess ,nil)
            }
        }
    }
}
