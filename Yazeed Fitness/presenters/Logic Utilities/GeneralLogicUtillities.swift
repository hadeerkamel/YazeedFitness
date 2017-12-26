//
//  GeneralLogicUtillities.swift
//  Mahir_Client
//
//  Created by Mohamed Hashem on 4/25/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import UIKit
//import PhoneNumberKit

let appLanguageString: String = GeneralLogicUtillities.getLanguageCodeFromViewDirection()
public let isAppArabic: Bool = GeneralLogicUtillities.AppInArabic
let countryCode: String = GeneralLogicUtillities.countryCode

open class GeneralLogicUtillities
{    
    static func getLanguageCodeFromViewDirection() ->String
    {
        if(UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft) {
            //RTL
            return "ar"
        } else {
            //LTR
            return "en"
        }
    }
    static var AppInArabic:Bool
        {
        get{return getLanguageCodeFromViewDirection() == "ar"}
    }
    
    static var countryCode: String
    {
        get {
            if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
                return countryCode
            }
            return ""
            
        }
    }
    
//    static func ParsePhoneNumber(number: String) ->(Regon:String,locale:String,Number:String) {
//        let phoneNumberKit = PhoneNumberKit()
//        var Number: String = ""
//        var locale: String = ""
//        var Regon: String = ""
//        do {
//            let phoneNumber = try phoneNumberKit.parse("+"+number)
//            
//            Number = String(phoneNumber.nationalNumber)
//            locale = String(phoneNumber.countryCode)
//            Regon = phoneNumberKit.getRegionCode(of: phoneNumber)!
//        }
//        catch {
//           print("parser Error: \(error)")
//        }
//        return (Regon,locale,Number)
//    }
    
    static func fileSize(filePath:String) -> UInt64
    {
        let filePath = "your path here"
        var fileSize : UInt64 = 0
        
        do {
            //return [FileAttributeKey : Any]
            let attr = try FileManager.default.attributesOfFileSystem(forPath: filePath)
            fileSize = attr[FileAttributeKey.size] as! UInt64
            
            //if you convert to NSDictionary, you can get file size old way as well.
            let dict = attr as NSDictionary
            fileSize = dict.fileSize()
        } catch {
            
            print("Error: \(error)")
        }
        return fileSize
    }
    

}
extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
