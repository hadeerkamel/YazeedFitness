//
//  UIConstant.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation
import UIKit

class UIConstants {
    
    // colors
    class Colors {
        static let heavyBlue = #colorLiteral(red: 0.04153297096, green: 0.2247544527, blue: 0.3238565326, alpha: 1)
        static let alertErrorColor = #colorLiteral(red: 0.8681047559, green: 0.1881445348, blue: 0.09078089148, alpha: 1)
        
        
    }
    class AppFonts {
        static let LightName = "CoconNextArabic-Light"
        static let RegularName = "CoconNextArabic-Regular"
        static let BoldName = "CoconNextArabic-Bold"
        
    }
    class Screens {
        
       static let LOGIN = "VcLogin"
       static let ForgotPassword = "VcForgotPassword"
       static let Register = "VcRegister"
       static let EditWeightPopUp = "VcEditWeightPopUp"
       static let ContactUs = "VcContactUs"
       static let Doctors = "VcDoctors"
       static let AboutUs = "VcAboutUs"
       static let Deps = "DeparmentsVC"
       static let DepDetails = "DepDetailsVC"
       static let DepGallery = "GalleryDepVC"
    }
   
    
    static var LoginStory = UIStoryboard(name: "Login", bundle: Bundle.main)
    static var HomeStory = UIStoryboard(name: "Home", bundle: Bundle.main)
    static var SideMenuStory = UIStoryboard(name: "SideMenu", bundle: Bundle.main)
    static var ContactUsStory = UIStoryboard(name: "ContactUs", bundle: Bundle.main)
    static var DoctorsStory = UIStoryboard(name: "Doctors", bundle: Bundle.main)
    static var AboutUsStory = UIStoryboard(name: "AboutUs", bundle: Bundle.main)
    static var DepartmentsStory = UIStoryboard(name: "Departments", bundle: Bundle.main)


}
