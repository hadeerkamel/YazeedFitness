//
//  UImessageManager.swift
//  Mahir_Client
//
//  Created by Mohamed Hashem on 9/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import BRYXBanner


//enum messageTypes{
//    case info
//    case error
//}
func showMessageBanner(title: String, subTitle: String = "",error:Bool = false) {
    
    let banner = Banner(title: title, subtitle: subTitle, image: nil, backgroundColor: error ? UIConstants.Colors.alertErrorColor : UIConstants.Colors.heavyBlue)
    banner.alpha = 0.9
    banner.titleLabel.font = UIFont(name:UIConstants.AppFonts.LightName , size: 16)
    banner.dismissesOnTap = true
    banner.show(duration: 3.0)
    
}
/*func showMessageBannerBottom(title: String) ->Banner {
    
    let banner = Banner(title: title, image: nil, backgroundColor:  AppColores.lightTheme)
    banner.titleLabel.font = UIFont(name: AppFonts.RegularName, size: 16)
    banner.position = BannerPosition.bottom
    banner.dismissesOnTap = false
    banner.show()
    return banner
}*/

/*func alertRequestFail(message:String){
    
    let uiAlert = UIAlertController(title:NSLocalizedString("REQUEST FAILED", comment: ""), message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    HomeScreen.present(uiAlert, animated: true, completion: nil)

    uiAlert.addAction(UIAlertAction(title: NSLocalizedString("RETRY", comment: ""), style: .default, handler: { action in
        
        //Resend the request
        BlHome.ConfirmRequest(params:nil)
        {(ResponseStat, message, data) in
            
            if ResponseStat == .Success
            {
            }
            else
            {
                if ResponseStat != .Offline {
                    //retray or cancel
                    alertRequestFail( message: message)
                }
            }
        }
       
    }))
    
    uiAlert.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .cancel, handler: { action in
        
        //call start request
        //back to Home
        AppDelegate.HomeNavControler.popToRootViewController(animated: false)
        
        
    }))
    
}*/
