//
//  DalLgoin.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation

class DalLogin
{
    static func EmailSignIn(mobile:String,password:String,callback: @escaping ( _ success:ResponseStat, _ message:String ,_ NeedActivation:Bool, _ obj : UserEntity?)->())
    {
        
        let params:[String : Any] = [
            "MobileOrName" : mobile,
            "Password" : password,
            
            "Lang" : GeneralLogicUtillities.getLanguageCodeFromViewDirection()
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.Login, hTTPMethod: Method.post, parameters: params,
                               callbackBase: { (baseResponse, Message) in
                                
                                var mess = Message;
                                var obj : UserEntity? = nil
                                var NeedActivation = false
                                
                                if baseResponse.ResponseStat == ResponseStat.Success
                                {
//                                    obj = UserEntity(fromDictionary: baseResponse.message as! [String:Any])
                                }
                                else
                                {
                                    let error = (baseResponse.message as? [String:Any])
                                    mess = error?["text"] as? String ?? Message
                                    
                                    if (error?["flag"] as? String == "AccountNotActivated")
                                    {
                                        NeedActivation = true
                                    }
                                }
                                callback(baseResponse.ResponseStat,mess,NeedActivation,obj)
                                
        })
    }


}
