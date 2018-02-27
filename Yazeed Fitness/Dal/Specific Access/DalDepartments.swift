//
//  DalDepartments.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DalDepartments {
    static func getDepartments(userToken:String ,callBack: @escaping(_ success:ResponseStat,_ message:String, _ deps:Departments?)->()){
        let params:[String:Any] = [
            "userToken" : userToken
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.GetDeps, hTTPMethod: .post, parameters: params,
                                callbackBase :{ (baseResponse, Message) in
                                    
                                    var mess = Message
                                    var deps : Departments? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        deps =  Departments(fromArrayDictionary: baseResponse.data as! [[String:Any]])
                                    }else{
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                    }
                                    callBack(baseResponse.ResponseStat ,mess ,deps)
        })

    }
    static func getDepImages(userToken:String ,depID:Int ,callBack: @escaping(_ success:ResponseStat,_ message:String, _ deps:DepImages?)->()){
        let params:[String:Any] = [
            "userToken" : userToken,
            "department_id":depID
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.GetDepImages, hTTPMethod: .post, parameters: params,
                                callbackBase :{ (baseResponse, Message) in
                                    
                                    var mess = Message
                                    var depsImages : DepImages? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        depsImages =  DepImages(fromArrayDictionary: baseResponse.data as! [[String:Any]])
                                    }else{
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                    }
                                    callBack(baseResponse.ResponseStat ,mess ,depsImages)
        })

        
    }
    static func getDepVideos(userToken:String ,depID:Int ,callBack: @escaping(_ success:ResponseStat,_ message:String, _ deps:DepVideos?)->()){
        let params:[String:Any] = [
            "userToken" : userToken,
            "department_id":depID
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.GetDepVideos, hTTPMethod: .post, parameters: params,
                                callbackBase :{ (baseResponse, Message) in
                                    
                                    var mess = Message
                                    var depsVideos : DepVideos? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        depsVideos =  DepVideos(fromArrayDictionary: baseResponse.data as! [[String:Any]])
                                    }else{
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                    }
                                    callBack(baseResponse.ResponseStat ,mess ,depsVideos)
        })
        
        
    }
}
