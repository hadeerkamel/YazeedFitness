//
//  PrLogin.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 8/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
import UIKit
var ISLoged : Bool{
get{
    return PrLogin.UserToken != nil
}
}
class PrLogin {
    //MARK: - Properties -
    static var userProfile : UserEntity!
    
   
    internal static var UserToken : String!
        {
        get
        {
            
            let val = UserDefaults.standard.object(forKey: "UserToken")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            
            UserDefaults.standard.setValue(newValue, forKey: "UserToken")
            UserDefaults.standard.synchronize();
        }
    }
    
    private static var UserName_ : String!
    internal static var UserName : String!
        {
        get
        {
            if UserName_ != nil
            { return UserName_}
            let val = UserDefaults.standard.object(forKey: "UserName")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            UserName_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "UserName")
            UserDefaults.standard.synchronize();
        }
    }

    private static var Email_ : String!
    internal static var Email : String!
        {
        get
        {
            if Email_ != nil
            { return Email_}
            let val = UserDefaults.standard.object(forKey: "Email")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            Email_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "Email")
            UserDefaults.standard.synchronize();
        }
    }

    private static var Age_ : String!
    internal static var Age : String!
        {
        get
        {
            if Age_ != nil
            { return Age_}
            let val = UserDefaults.standard.object(forKey: "Age")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            Age_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "Age")
            UserDefaults.standard.synchronize();
        }
    }

    private static var Height_ : String!
    internal static var Height : String!
        {
        get
        {
            if Height_ != nil
            { return Height_}
            let val = UserDefaults.standard.object(forKey: "Height")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            Height_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "Height")
            UserDefaults.standard.synchronize();
        }
    }

    private static var CurrentWeight_ : String!
    internal static var CurrentWeight : String!
        {
        get
        {
            if CurrentWeight_ != nil
            { return CurrentWeight_}
            let val = UserDefaults.standard.object(forKey: "CurrentWeight")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            CurrentWeight_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "CurrentWeight")
            UserDefaults.standard.synchronize();
        }
    }

    private static var IdealWeight_ : String!
    internal static var IdealWeight : String!
        {
        get
        {
            if IdealWeight_ != nil
            { return IdealWeight_}
            let val = UserDefaults.standard.object(forKey: "IdealWeight")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            IdealWeight_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "IdealWeight")
            UserDefaults.standard.synchronize();
        }
    }

    private static var Image_ : String!
    internal static var Image : String!
        {
        get
        {
            if Image_ != nil
            { return Image_}
            let val = UserDefaults.standard.object(forKey: "Image")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            Image_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "Image")
            UserDefaults.standard.synchronize();
        }
    }

    private static var RegisterdWeight_ : String!
    internal static var RegisterdWeight : String!
        {
        get
        {
            if RegisterdWeight_ != nil
            { return RegisterdWeight_}
            let val = UserDefaults.standard.object(forKey: "RegisterdWeight")
            if val == nil {return nil}
            return (rawValue: val as! String);
        }
        set
        {
            RegisterdWeight_ = newValue as String?
            UserDefaults.standard.setValue(newValue, forKey: "RegisterdWeight")
            UserDefaults.standard.synchronize();
        }
    }
    //MARK: Validators
    static func validateWeightHeightNumber(numberString:String) ->Bool{
        if !ValidationUtil.validateNumbersOnly(input: numberString) {
            return false
        }
        if numberString.hasPrefix("0") || numberString.characters.count > 3{
            return false
        }
        return true
    }
    static func validateRgestrationData(userPickedImage: Bool, username:String, email: String, userPickedBirthDate: Bool, height: String ,currentWeight: String, idealWeight:String,password: String,repeatPass: String) ->String{
        var validationMessage = ""
        if !userPickedImage {
            validationMessage = Messages.REG_Validation.ProfileImage
        }
        else if username == ""{
            validationMessage = Messages.REG_Validation.EmptyUsername
        }
        else if username.characters.count < 3{
            validationMessage = Messages.REG_Validation.ShortName
        }
        else if !ValidationUtil.validateCharacterAlphabetOnly(input: username){
            validationMessage = Messages.REG_Validation.invalideUsername
        }
        else if !ValidationUtil.isValidEmail(testStr:email){
            validationMessage = Messages.REG_Validation.Email
        }
        else if !userPickedBirthDate {
            validationMessage = Messages.REG_Validation.EmptyBirthDate
        }
        else if height == "" {
            validationMessage = Messages.REG_Validation.Height
        }
        else if !validateWeightHeightNumber(numberString: height){
            validationMessage = Messages.REG_Validation.InvalideHeight
        }
        else if currentWeight == ""{
            validationMessage = Messages.REG_Validation.CurrentWeight
        }
        else if !validateWeightHeightNumber(numberString:currentWeight){
            validationMessage = Messages.REG_Validation.InvalideWeight
        }
        else if idealWeight == ""{
            validationMessage = Messages.REG_Validation.IdealWeight
        }
        else if !validateWeightHeightNumber(numberString:idealWeight){
            validationMessage = Messages.REG_Validation.InvalideWeight
        }
        else if password == ""{
            validationMessage = Messages.REG_Validation.Password
        }
        else if password.characters.count < 6{
            validationMessage = Messages.REG_Validation.Passwordlength
        }
        else if repeatPass != password {
            validationMessage = Messages.REG_Validation.RepaetPassword
        }
        return validationMessage
    }
    static func validateLoginData(email: String ,password: String) -> String{
         var validationMessage = ""
         if !ValidationUtil.isValidEmail(testStr:email){
             validationMessage = Messages.REG_Validation.Email
          }
         else if password == ""{
            validationMessage = Messages.REG_Validation.Password
         }
         else if password.characters.count < 6{
            validationMessage = Messages.REG_Validation.Passwordlength
        }
        return validationMessage
    }
    static func validateUpdateProfileData(username:String,email:String,ageText:String,height:String,currentWeight:String,idealWeight:String) -> String{
        var validationMessage = ""
        if username == ""{
            validationMessage = Messages.REG_Validation.EmptyUsername
        }
        else if username.characters.count < 3{
            validationMessage = Messages.REG_Validation.ShortName
        }
        else if !ValidationUtil.validateCharacterAlphabetOnly(input: username){
            validationMessage = Messages.REG_Validation.invalideUsername
        }
        else if !ValidationUtil.isValidEmail(testStr:email){
            validationMessage = Messages.REG_Validation.Email
        }
        else if ageText == "" {
            validationMessage = Messages.REG_Validation.EmptyBirthDate
        }
        
        return validationMessage
        
    }
    //MARK: - DalCaller
    static func register (username: String, email: String, birthDate: String, height: String, currentWeight: String, idealWeight: String, password: String, profileImage: UIImage, callBack: @escaping (_ success: Bool ,_ message: String)->()){
        
      /*  let currentDate = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
        let age = ageComponents.year!*/
        
        DalLogin.Register(username: username, email: email, age: birthDate, height: height, currentWeight: currentWeight, idealWeight: idealWeight, password: password, profileImage: profileImage){ (responseStat ,message,obj) in
            
            if responseStat == .Success {
               
                callBack(true,Messages.REG_Response.Success)
            }else{
                callBack(false,message)
            }
        }
    }
    static func login(email: String , password: String ,callBack: @escaping (_ success: Bool ,_ message: String )->()){
        
        DalLogin.EmailSignIn(email: email , password: password){ (ResponseState , message ,needActivation,obj) in
            if ResponseState == .Success{
                
                if needActivation{
                    callBack (false , message)
                }else{
                    
                    PrLogin.handleLoginSuccess(authentcationData: obj!) {(profileSuccess)in
                      callBack(profileSuccess , "")
                    }
                }
            }else{
               
                callBack (false , message)
            }
            
        }

        
        
    }
    static func getProfile (userToken:String,callBack: @escaping (_ success: Bool,_ message: String )->()){
        DalLogin.GetProfile(userToken: userToken) { (ResponseState , message, userEntity) in
            if  ResponseState == .Success{
                userProfile = userEntity
                handleGetProfileSuccess()
                callBack(true,"")
            }else{
                callBack(false,message)
            }
            
        }
    }
    static func updateProfile(name :String ,email:String ,age:String, currentWeight:String, idealWeight:String ,height:String,image:UIImage,callBack: @escaping (_ success: Bool,_ message: String )->()){
        
        DalLogin.UpdateProfile(userToken: UserToken, name: name, email: email, age: age, currentWeight: currentWeight, idealWeight: idealWeight, height: height,profileImage: image){ (ResponseState ,message) in
            if ResponseState == .Success {
                handleUpdateProfileSuccess()
                callBack(true , message)
            }else{
                callBack(false , message)
            }
        }
    }
    static func changePassword (oldPassword:String ,newPassword:String,callBack: @escaping (_ success: Bool,_ message: String )->()){
        DalLogin.changePassword(userToken: UserToken, oldPassword: oldPassword, newPassword: newPassword){
            (ResponseState ,message) in
            if ResponseState == .Success{
                
                callBack(true , message)
            }else{
                callBack(false , message)
            }
        }
    }
    static func logOut(callBack: @escaping (_ success: Bool,_ message: String )->()){
        
        DalLogin.LogOut(userToken: UserToken){ (ResponseState ,message) in
            if ResponseState == .Success{
                handleLogOutSuccess()
                callBack(true , message)
            }else{
                callBack(false , message)
            }
        }
    }

    //MARK: - Handlers -
    static func handleRegistrationSuccess(){
       
    }
    static func handleLoginSuccess(authentcationData : AuthentcationModel ,callBack: @escaping(Bool)->())  {
        
        PrLogin.getProfile(userToken: authentcationData.userToken){ (success , message) in
            if success{
                UserToken = authentcationData.userToken
                if HomeScreen != nil{
                    HomeScreen.populateUserData()
                   
                }
            }else{
                
            }
            callBack(success)
        }
        
    }
    static func handleGetProfileSuccess(){
        UserName = userProfile.name
        Email = userProfile.email
        Age = userProfile.age
        Height = userProfile.height
        RegisterdWeight = userProfile.registerdWeight
        CurrentWeight = userProfile.currentWeight
        IdealWeight = userProfile.idealWeight
        Image = userProfile.image
    }
    static func handleUpdateProfileSuccess(){
        PrLogin.getProfile(userToken: UserToken){ (success , message) in
            if success{
                if HomeScreen != nil{
                    HomeScreen.populateUserData()
                }
            }else{
                
            }
        }
    }
    static func handleLogOutSuccess(){
        resetDefaults()
    }
    static func resetDefaults() {
       /* let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()*/
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}
