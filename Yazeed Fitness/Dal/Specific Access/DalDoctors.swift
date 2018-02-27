//
//  DalDoctors.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 18/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DalDoctors{
    static func SearchDoctors(userToken:String,specialty:String, callBack: @escaping (_ success:ResponseStat, _ message:String , _ doctors : Doctors?)->()){
        let params:[String:Any] = [
            "userToken" : userToken,
            "speciality" : specialty
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.SearchDoctors, hTTPMethod: .post, parameters: params,
                                callbackBase :{ (baseResponse, Message) in
                                    
                                    var mess = Message
                                    var doctors : Doctors? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        doctors = Doctors(fromArrayDictionary: baseResponse.data as! [[String:Any]])
                                    }else{
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                    }
                                    callBack(baseResponse.ResponseStat ,mess ,doctors)
        })
    }
    
    static func getDoctors(userToken:String, callBack: @escaping (_ success:ResponseStat, _ message:String , _ doctors : Doctors?)->()){
        let params:[String:Any] = [
            "userToken" : userToken
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.GetDoctors, hTTPMethod: .post, parameters: params,
                                callbackBase :{ (baseResponse, Message) in
                                    
                                    var mess = Message
                                    var doctors : Doctors? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        doctors = Doctors(fromArrayDictionary: baseResponse.data as! [[String:Any]])
                                    }else{
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                    }
                                    callBack(baseResponse.ResponseStat ,mess ,doctors)
        })
    }

}
