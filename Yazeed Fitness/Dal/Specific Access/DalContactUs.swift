//
//  DalContactUs.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 23/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DalContactUs
{
    static func ContactUs(userToken:String ,subject:String ,message:String ,callback:@escaping(_ success:ResponseStat , _ Message:String)->()){
        
        let params:[String : Any] = [
            "userToken" : userToken,
            "subject" : subject,
            "body" : message
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.ContactUs, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        
                                    }else{
                                        
                                    }
                                    callback(baseResponse.ResponseStat ,mess)
                                    
        })

        
    }
}
