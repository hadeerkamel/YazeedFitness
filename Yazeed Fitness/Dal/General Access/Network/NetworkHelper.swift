//
//  NetworkHelper.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/25/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//


import Foundation
import Alamofire


enum Method : String
{
    case get="GET"
    case post="POST"
}

enum ResponseType : Int
{
    case StringJson = 0
    case DictionaryJson = 1
    case Dictionary = 2
    
}
enum ResponseStat : Int
{
    case Success=1
    case InvalidToken=2
    case Offline=3
    case InternalServerError=4
    case Other=10
}

class NetworkHelper
{
    class UploadableFile {
        var requestKey : String!
        var fileData : Data!
        var fileName : String!
        var fileMimeType : String!
        
    }
    
    internal static func YazeedAPI(domainurl:String? = nil, service:String ,hTTPMethod: Method, parameters: [String:Any]?, Files: [UploadableFile]? = nil, httpBodyData:Data? = nil
        , responseType: ResponseType = .StringJson
        , callbackString: ((DataResponse<String>) -> Void)? = nil
        //  , callbackSwiftyDic: ((_ JSON: JSON, _ Error: Error?) -> Void)? = nil
        , callbackBase: ((ModBaseResponse,String) -> Void)? = nil)
    {
        
        let UrlString = (domainurl == nil ? NetworkConstants.BaseAPI_URL : domainurl!) + service;
        let url = URL(string: UrlString)!
        var request : DataRequest!;
        
        print("request url >>>> "+UrlString)
        print("Request Body >>>> "+(httpBodyData == nil ? (parameters == nil ? "" : String(describing: parameters!)) :  String(describing:httpBodyData!)))//{"Content-Type":"application/json"}
        
        if Files == nil && parameters != nil
        {
            // www form
            // request = Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded"])//"application/x-www-form-urlencoded"
            
            // json
            request = Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            
        }
        else if Files != nil
        {
            //            var allParams = parameters ?? [String:Any]()
            //               allParams.update(other: Files!)
            
            //     request = Alamofire.request(url, method: .post, parameters: allParams, encoding: URLEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded"])//"application/x-www-form-urlencoded"
            
            Alamofire.upload(multipartFormData:
                { (MultipartFormData) in
                    
                    for fileinfo in Files!
                    {
                        MultipartFormData.append(fileinfo.fileData , withName: fileinfo.requestKey,fileName : fileinfo.fileName, mimeType: fileinfo.fileMimeType)//application/octet-stream  "image.png", mimeType: "image/png"
                    }
                    for (key, value) in parameters!
                    {
                        MultipartFormData.append(String(describing: value).data(using: .utf8)!, withName: key)
                    }
            }, to: url, encodingCompletion:
                { (encodingResult) in
                    switch(encodingResult)
                    {
                    case .success(let upload, _, _):
                        //var rr = upload.request;
                        // rr?.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                        //   request = upload
                        
                        HandleResponse(request: upload,responseType: responseType,callbackString: callbackString, callbackBase: callbackBase);
                        break
                    case .failure(_):
                        print("encodingResult failed")
                        break
                        
                    }
            })
        }
        else if httpBodyData != nil
        {
            var req = URLRequest(url: url)
            req.httpBody = httpBodyData!
            request = Alamofire.request(req)
        }
        
        if request != nil
        {
            HandleResponse(request: request,responseType: responseType,callbackString: callbackString, callbackBase: callbackBase);
        }
    }
    
    static func HandleResponse(request : DataRequest, responseType: ResponseType = .StringJson
        , callbackString: ((DataResponse<String>) -> Void)? = nil
        , callbackBase: ((ModBaseResponse,String) -> Void)? = nil)
    {
        request.responseString
            { response in
                
                print("...... Network code : \(response.response?.statusCode ?? 0 )")
                print("...... API Result : \(response.result.value ?? "<NoResult>")")
                //  if !EncryptionEnabled  {   print("API Result ..... \(response.result.value)")}
                if (responseType == .StringJson)
                {
                    var message = ""
                    
                    var baseResponse = ModBaseResponse()
                    if(response.error != nil)
                    {
                        baseResponse.ResponseStat = ResponseStat.Offline;
                        if let err = response.error as? URLError,
                            [URLError.Code.notConnectedToInternet ,URLError.Code.networkConnectionLost,URLError.Code.timedOut].contains(err.code)
                        {
                            // No internet
                            message = NSLocalizedString("NoNetworkMessage", comment: "serverErorr")
                            
                        }
                        
                    }
                    else if (response.response?.statusCode == 500)
                    {
                        baseResponse.ResponseStat = ResponseStat.InternalServerError;
                        message = NSLocalizedString("ERROR_OCCURED", comment: "serverErorr")
                    }
                    else
                    {
                        let jsonString = response.result.value
                        
                        // if EncryptionEnabled {jsonString = jsonString?.aesDecrypt(key: Constants.Key, iv: Constants.IV); print("API Result .....\(jsonString!)");}
                        // custom section
                        if jsonString == "<HTML></HTML>" || jsonString == ""
                        {
                            baseResponse.ResponseStat = ResponseStat.InternalServerError;
                            message = NSLocalizedString("an error has occured please try again", comment: "serverErorr")
                            callbackBase!(baseResponse,message);
                            return
                        }
                        
                        let asDic = NetworkHelper.convertToDictionary(text: jsonString!);
                        if asDic == nil {
                            baseResponse.ResponseStat = ResponseStat.InternalServerError;
                            message = NSLocalizedString("Bad Server Response", comment: "serverErorr")
                            callbackBase!(baseResponse,message);
                            return
                        }
                        
                        baseResponse = ModBaseResponse.Populate(dictionary: asDic!)
                        
                        if 200 ... 299 ~= Int(baseResponse.status ?? "0")!
                        {
                            baseResponse.ResponseStat = ResponseStat.Success
                        }
                        else  if baseResponse.status == "403"
                        {
                            baseResponse.ResponseStat = ResponseStat.InvalidToken
                            // logout
                            
                        }
                        else
                        {
                            baseResponse.ResponseStat = ResponseStat.Other;
                        }
                        
                        if let mess = baseResponse.message as? String
                        {
                            message = mess
                        }
                        else
                        {
                            //                                    let errors = baseResponse.message as! [String:Any]
                            //                                    message = errors.description
                            
                            //                                    if let err = (errors["error"] as? String)
                            //                                    {
                            //                                        if err == "Nonauthorized"
                            //                                        {
                            //                                            baseResponse.ResponseStat = ResponseStat.InvalidToken
                            //                                            //      LoginP.logout()
                            //                                        }
                            //                                        //screen.view.makeToast("Invalid access token")
                            //                                    }
                        }
                        
                    }
                    callbackBase!(baseResponse,message);
                    
                }
        }
        
    }
    
    internal static func DictionaryToJSON(InjectedDictionary : Dictionary<String, Any>) ->  String
    {
        var FinalDictionaryString = ""
        
        let data = try! JSONSerialization.data(withJSONObject: InjectedDictionary, options: [])
        FinalDictionaryString = String(bytes: data, encoding: .utf8)!
        
        print("--converted jason result >>> " + FinalDictionaryString)
        
        return FinalDictionaryString
    }
    internal static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
