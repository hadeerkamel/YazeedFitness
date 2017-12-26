//
//  ValidationUtil.swift
//  Brands
//
//  Created by M-Hashem on 2/23/17.
//  Copyright © 2017 Mohamed Hashem. All rights reserved.
//

import Foundation
//import libPhoneNumber_iOS
//import PhoneNumberKit

class ValidationUtil
{
    
    static func isValidEmail(testStr:String) -> Bool
    {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
//    class func validatePhoneNumber(phoneNumber: String,regioncode: String) -> Bool {
//        //return isValidPhone(value: phoneNumber, region: regioncode)
//        do
//         {
//            let phoneNumberKit = PhoneNumberKit()
//            
//            let _ = try phoneNumberKit.parse(phoneNumber, withRegion: regioncode, ignoreType: false)
//            
//           
//           return true
//            
//        }
//        catch {
//            print("Generic parser error")
//            return false
//        }
//        
//    }

//    static func formatePhoneNumber(number: String, region: String) ->String {
//        let phoneNumberKit = PhoneNumberKit()
//        var formatedNumber: String = ""
//        do {
//            let phoneNumber = try phoneNumberKit.parse(number, withRegion: region, ignoreType: true)
//            formatedNumber = phoneNumberKit.format(phoneNumber, toType: .e164)
//        }
//        catch {
//            print("Generic parser error")
//        }
//        return formatedNumber
//    }
    
    
//    static func isValidPhone(value: String, region: String) -> Bool {
//        
//        let phoneUtil = NBPhoneNumberUtil()
//        
//        var Valid = false
//        do
//        {
//            let phoneNumber : NBPhoneNumber = try phoneUtil.parse(value, defaultRegion: region)
//            let formattedString: String = try phoneUtil.format(phoneNumber, numberFormat: .NATIONAL)
//            
//            NSLog("[%@]", formattedString)
//            Valid = true
//        }
//        catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        
//        return Valid
//    }
    
    // MARK: - Validation
    
   static func validateTextStartByAlphabet(fullName: String, minChractNumber: String, maxCharNumber: String) ->Bool {
        do
        {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z]{\(minChractNumber),\(maxCharNumber)}$", options: .caseInsensitive)
            if regex.matches(in: fullName, options: [], range: NSMakeRange(0, fullName.characters.count)).count > 0  {
                return true}
        }
        catch { return false }
        return false
    }
    
   static func validateCharacterAlphabetOnly(input: String) ->Bool {
        do
        {
            let regex = try NSRegularExpression(pattern: "[A-Za-zء-ي]", options: .caseInsensitive)
            if regex.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count)).count > 0  {
                return true}
        }
        catch { return false }
        return false
    }
    
   static func validateAlphanumricesOnly(input: String) ->Bool {
        do {
            let regEx = try NSRegularExpression(pattern: "[0-9A-Za-zء-ي]", options: .caseInsensitive)
            if regEx.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count)).count > 0  {
                return true}
        }
        catch { return false }
        return false
    }
    
   static func validateAlphnumricWithSpecialChracter(input: String) ->Bool {
        do {
            let regEx = try NSRegularExpression(pattern: "[0-9A-Za-zء-ي\\_\\.\\-]", options: .caseInsensitive)
            if regEx.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count)).count > 0  {
                return true}
        }
        catch { return false }
        return false
    }
    
   static func validatePasswordStrength(password: String) ->Bool {
        if(password.characters.count<6){
            return false;
        }else{
            do
            {
                let regex = try NSRegularExpression(pattern: "(?=.*[a-z])(?=.*[A-Z])(?=.*[\\d])(?=.*([^\\w])).+",options: .caseInsensitive)
                if regex.matches(in: password, options: [], range: NSMakeRange(0, password.characters.count)).count > 0  {
                    return true}
            }
            catch { return false }
        }
        return false
    }
    
   static func validateNumbersOnly(input: String) ->Bool {
        do
        {
            let regex = try NSRegularExpression(pattern: "[0-9٠-٩]", options: .caseInsensitive)
            if regex.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count)).count > 0  {
                return true}
        }
        catch { return false }
        return false
    }
}
