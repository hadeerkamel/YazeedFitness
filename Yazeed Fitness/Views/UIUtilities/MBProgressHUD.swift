//
//  MBProgressHUD.swift
//  Yazeed-Fitness
//
//  Created by MAC on 4/30/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import MBProgressHUD


extension MBProgressHUD {
    
    func showWithTextWithUI() {
//        self.contentColor = UIColor().HexToColor(hexString: UIColor.navigationBarcolor)
        self.backgroundView.style = .solidColor
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
    }
    static func customInit(forview:UIView,lable:String) -> MBProgressHUD {
        let progress = MBProgressHUD.showAdded(to: forview, animated: true)
        progress.showWithTextWithUI()
        progress.label.text = lable;
        return progress
        
    }
}
