//
//  UIViewController.swift
//  Mahir_Client
//
//  Created by MAC on 4/30/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD


extension UIViewController {
    
    func showAlertControllerWith(title: String?, message: String, actions:UIAlertAction...)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if actions.count == 0
        {
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
        }
        else
        {
            for item in actions
            {
                alertController.addAction(item)
            }
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func toggleSWRevealViewController() {
         //self.revealViewController().revealToggle(self.revealViewController())
        HomeScreen.openCloseSideMenu(self)

    }
    func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
}



