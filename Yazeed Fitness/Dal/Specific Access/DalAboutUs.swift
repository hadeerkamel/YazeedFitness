//
//  DalAboutUs.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class DalAboutUs {
    static func getAbout(userToken:String,callBack: @escaping(_ Response:ResponseStat, _ message:String, _ obj:AboutModel?)->()){
        let params:[String : Any] = [
            "userToken" : userToken
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.AboutUs, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    var obj:AboutModel? = nil
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        obj = AboutModel(fromDictionary: (baseResponse.data as! [Any])[0] as! [String:Any] )
                                    }else{
                                        
                                    }
                                    callBack(baseResponse.ResponseStat ,mess,obj)
                                    
        })

        
    }
}
