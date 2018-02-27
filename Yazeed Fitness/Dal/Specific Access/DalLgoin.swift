//
//  DalLgoin.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation
import UIKit

class DalLogin
{
    
    static var deviceToken:String
        {
        get {return (UIDevice.current.identifierForVendor?.uuidString)!}
    }
    
    static func EmailSignIn(email:String,password:String,callback: @escaping ( _ success:ResponseStat, _ message:String ,_ NeedActivation:Bool, _ obj : AuthentcationModel?)->())
    {
        
        let params:[String : Any] = [
            "email" : email,
            "password" : password,
            "deviceToken" : deviceToken
          //  "Lang" : GeneralLogicUtillities.getLanguageCodeFromViewDirection()
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.Login, hTTPMethod: Method.post, parameters: params,
                               callbackBase: { (baseResponse, Message) in
                                
                                var mess = Message;
                                var obj : AuthentcationModel? = nil
                                var NeedActivation = false
                                
                                if baseResponse.ResponseStat == ResponseStat.Success
                                {
                                    if (baseResponse.FullResponse["status"] as! String == "201") {
                                        NeedActivation = true
                                        mess = baseResponse.message as! String
                                    }else{
                                        let model: [String:Any] = [
                                            "userToken" : baseResponse.data as Any
                                        ]
                                        obj = AuthentcationModel(fromDictionary: model)

                                    }
                                    
                                }
                                else
                                {
                                    //wrong email or pass
                                    if baseResponse.message != nil{
                                      mess = baseResponse.message as! String
                                    }
                                    
                                  
                                }
                                callback(baseResponse.ResponseStat,mess,NeedActivation,obj)
                                
        })
    }
    
    static func Register(username:String,email:String,age:String,height:String,currentWeight:String,idealWeight:String,password:String,profileImage:UIImage,callback: @escaping ( _ success:ResponseStat, _ message:String , _ obj:AuthentcationModel?)->())
    {
        
        let params:[String : Any] = [
            "name" : username,
            "email" : email,
            "password" : password,
            "age" : age,
            "height": height,
            "ideal_weight" : idealWeight,
            "current_weight" : currentWeight,
            "deviceToken" : deviceToken
          
        ]
        let file = NetworkHelper.UploadableFile()
        file.fileData = UIImageJPEGRepresentation(profileImage, 0.5)
        file.fileMimeType = "image/jpeg"
        file.requestKey = "image"
        file.fileName = "image.jpg"
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.Register, hTTPMethod: Method.post, parameters: params,Files:[file],
                                callbackBase: { (baseResponse, Message) in
                                    
                                    var mess = Message;
                                    var obj : AuthentcationModel? = nil
                                                                   
                                    if baseResponse.ResponseStat == ResponseStat.Success
                                    {
                                        let model: [String:Any] = [
                                            "userToken" : baseResponse.data as Any
                                        ]
                                        obj = AuthentcationModel(fromDictionary: model)
                                        
                                    }
                                    else
                                    {
                                        //let error = FailRegisterModel(fromDictionary: (baseResponse.message as! [String:Any])).error
                                        let error = baseResponse.data as! String
                                        mess = error
                                        
                                       
                                    }
                                    callback(baseResponse.ResponseStat,mess,obj)
                                    
        })
    }
    static func ForgetPassword(email:String,callback: @escaping ( _ success:ResponseStat, _ message:String )->())
    {
        
        let params:[String : Any] = [
            "email" : email,
            "deviceToken" : deviceToken
           
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.ForgetPassword, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse, Message) in
                                    
                                    var mess = Message;
                                    
                                    if baseResponse.ResponseStat == ResponseStat.Success
                                    {
                                        
                                    }
                                    else
                                    {
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                        
                                    }
                                    callback(baseResponse.ResponseStat,mess)
                                    
        })
    }
    static func GetProfile(userToken: String ,callback: @escaping (_ success:ResponseStat,_ message:String ,_ obj:UserEntity?)->())
    {
        let params:[String : Any] = [
            "userToken": userToken
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.GetProfile, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    
                                    var mess = Message
                                    var obj: UserEntity? = nil
                                    
                                    if baseResponse.ResponseStat == ResponseStat.Success
                                    {
                                        obj = UserEntity(fromDictionary: (baseResponse.data as! [String:Any] ))
                                    }
                                    else
                                    {
                                        if baseResponse.message != nil{
                                            mess = baseResponse.message as! String
                                        }
                                        
                                    }
                                    callback(baseResponse.ResponseStat,mess,obj)
        })
    }
    static func UpdateProfile(userToken :String ,name :String ,email:String ,age:String, currentWeight:String, idealWeight:String ,height:String,profileImage:UIImage,callBack: @escaping(_ success:ResponseStat,_ message:String)->()){
        
        let params:[String : Any] = [
            "userToken": userToken,
            "name" : name,
            "email" : email,
            "age" : age,
            "current_weight" : currentWeight,
            "ideal_weight" : idealWeight,
            "height" : height
        ]
        let file = NetworkHelper.UploadableFile()
        file.fileData = UIImageJPEGRepresentation(profileImage, 0.5)
        file.fileMimeType = "image/jpeg"
        file.requestKey = "image"
        file.fileName = "image.jpg"
        NetworkHelper.YazeedAPI(service: NetworkConstants.UpdateProfile, hTTPMethod: Method.post, parameters: params,Files:[file],
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        
                                    }else{
                                        
                                    }
                                    callBack(baseResponse.ResponseStat ,mess)
        
         })
    }
    static func changePassword(userToken:String,oldPassword:String,newPassword:String,callBack: @escaping(_ success:ResponseStat, _ message:String)->()){
        let params:[String:Any] = [
            "userToken": userToken,
            "currentPassword": oldPassword,
            "password": newPassword
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.ChangePassword, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        
                                    }else{
                                        
                                    }
                                    if baseResponse.message != nil {
                                        mess = baseResponse.message as! String
                                    }
                                    callBack(baseResponse.ResponseStat ,mess)
                                    
        })

    }
    static func updateWeight(userToken:String ,newWeight:String,callBack: @escaping(_ success:ResponseStat, _ message:String)->()){
        
        let params:[String:Any] = [
            "userToken": userToken,
            "current_weight":newWeight
        ]
        
        NetworkHelper.YazeedAPI(service: NetworkConstants.UpdateWeight, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        
                                    }else{
                                        
                                    }
                                    if baseResponse.message != nil {
                                        mess = baseResponse.message as! String
                                    }
                                    callBack(baseResponse.ResponseStat ,mess)
                                    
        })

        
    }
    static func LogOut(userToken:String ,callBack: @escaping(_ success:ResponseStat ,_ message:String)->()){
        let params:[String : Any] = [
            "userToken": userToken,
            "deviceToken": deviceToken
        ]
        NetworkHelper.YazeedAPI(service: NetworkConstants.LogOut, hTTPMethod: Method.post, parameters: params,
                                callbackBase: { (baseResponse ,Message) in
                                    var mess = Message
                                    if baseResponse.ResponseStat == ResponseStat.Success{
                                        
                                    }else{
                                        
                                    }
                                    callBack(baseResponse.ResponseStat ,mess)
                                    
        })
        
    }

}
