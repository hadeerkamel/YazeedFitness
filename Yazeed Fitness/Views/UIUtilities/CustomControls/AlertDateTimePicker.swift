//
//  AlertDateTimePicker.swift
//  Yazeed-Fitness
//
//  Created by Mohamed Hashem on 5/25/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import UIKit

class AlertDateTimePicker:UIViewController
{
    enum DatePickerMode: Int
    {
        case All = -1
        case LimitToPast   = 0
        case LimitToFuture = 1
        
    }
    
    
    static var didSelectDatePickerView:((_ selected:Date)->())?
    
    //MARK: - Alert Controller with PickerView -0.
    
    static func showAlertWithPicker(target: UIViewController,title: String, message: String,arabic:Bool = false,mode:DatePickerMode = .All, pickerMode:UIDatePickerMode, didselect: (( _:Date)->())?)
    {
        let alertPicker = AlertDateTimePicker()
        let pv = UIDatePicker()
        pv.datePickerMode = pickerMode
        if arabic {
            pv.locale = Locale(identifier: "ar_SA")
        }
        
        AlertDateTimePicker.didSelectDatePickerView = didselect
        
        let margendMessage = "\(message)\n\n\n\n\n\n\n\n"
        let alertController = UIAlertController(title: title, message: margendMessage, preferredStyle: .alert)
        AlertPicker.applyFont(obj: alertController, txt: title, TitleOrMessage: true, fontsize: 16)
        AlertPicker.applyFont(obj: alertController, txt: margendMessage, TitleOrMessage: false, fontsize: 15)
        
        let okstring = arabic ? "تم" : "ok"
        let okAction = UIAlertAction(title: okstring, style: .default)
        { (action) in
            AlertDateTimePicker.didSelectDatePickerView?(pv.date)
            alertPicker.removeFromParentViewController()
        }
        
        let cancelstring = arabic ? "الغاء" : "Cancel"
        let cancelAction = UIAlertAction(title: cancelstring, style: .cancel)
        { (action) in
            alertPicker.removeFromParentViewController()
        }
        
        // pv.selectRow(0, inComponent: 0, animated: true)
        selectedPickerViewItem = 0
        print(alertController.view.bounds.width)
        pv.frame = CGRect(x:0 ,y: 30,width: alertController.view.frame.width  ,height: 150)
        pv.autoresizingMask = [.flexibleWidth]
//        pv.autoresizingMask = [.flexibleHeight]
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // set datePickerMode
        switch mode
        {
            
        case DatePickerMode.LimitToPast:
            pv.maximumDate = Date()
//            pv.minimumDate = dateFormatter.date(from: "1950-01-01")
            break
            
        case DatePickerMode.LimitToFuture:
            pv.minimumDate = Date()
            //
            break
            
        default:
//            pv.minimumDate = dateFormatter.date(from: "1950-01-01")
//            pv.maximumDate = Date()
            break;
            
        }
        // pv.backgroundColor = UIColor.blackColor()
        //        pv. = alertPicker
        //        pv.delegate = alertPicker
        
        
        alertController.view.addSubview(pv)
        target.addChildViewController(alertPicker)
        alertPicker.didMove(toParentViewController: target)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        target.present(alertController, animated: true, completion: nil)
        
        AlertPicker.applyFont(obj: okAction, txt: okstring, TitleOrMessage: nil, fontsize: 15)
        AlertPicker.applyFont(obj: cancelAction, txt: cancelstring, TitleOrMessage: nil, fontsize: 15)
        //        pv.reloadAllComponents()
    }
   
    
    
}
