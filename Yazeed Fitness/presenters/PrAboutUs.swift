//
//  PrAboutUs.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class PrAboutUs{
    static func getAbout(callBack: @escaping(_ success:Bool,_ message:String,_ obj:AboutModel?)->()){
        DalAboutUs.getAbout(userToken: PrLogin.UserToken){ (responseState,mess,aboutData) in
            if responseState == ResponseStat.Success{
                callBack(true,mess,aboutData)
            }else{
                callBack(false,mess,nil)
            }
        }
    }
}
