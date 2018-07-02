//
//  AlertWithPicker.swift
//  Mo3idat
//
//  Created by MAC on 3/27/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import Foundation
import UIKit

protocol IKeyValBares
{
    var Key:String{get}
    var Val:String{get}
}

class KeyValBares: IKeyValBares
{
    internal var Val: String = ""
    
    internal var Key: String = ""
    
    init(k:String,v:String) {
        Key = k;
        Val = v;
    }
}


var itemsPickerView:[IKeyValBares] = []
var selectedPickerViewItem: Int = 0
var didSelectPickerView:((_ selected:IKeyValBares)->())?

class AlertPicker:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Alert Controller with PickerView -0.
    
    static func showAlertWithPicker(target: UIViewController,title: String, message: String,arabic:Bool = false,items:[IKeyValBares]?,itemsstring:[String]?,didselect: (( _:IKeyValBares)->())?){
        
        let alertPicker = AlertPicker()
        didSelectPickerView = didselect
        
        itemsPickerView = []
        if let items = items
        {
            itemsPickerView = items
        }
        else
        {
            for item in itemsstring! {
                itemsPickerView.append(KeyValBares(k: item, v: item))
            }
        }
        
        let margendMessage = "\(message)\n\n\n\n\n\n\n\n"
        let alertController = UIAlertController(title: title, message: margendMessage, preferredStyle: .alert)
        applyFont(obj: alertController, txt: title, TitleOrMessage: true, fontsize: 16)
        applyFont(obj: alertController, txt: margendMessage, TitleOrMessage: false, fontsize: 15)
        
        let okstring = arabic ? "تم" : "Ok"
        let okAction = UIAlertAction(title: okstring, style: .default) { (action) in
            didSelectPickerView?(itemsPickerView[selectedPickerViewItem])
            alertPicker.removeFromParentViewController()
        }
       
        
        let cancelstring = arabic ? "الغاء" : "Cancel"
        let cancelAction = UIAlertAction(title: cancelstring, style: .default) { (action) in
            alertPicker.removeFromParentViewController()
        }
        
        
        let pv = UIPickerView()
        pv.selectRow(0, inComponent: 0, animated: true)
        selectedPickerViewItem = 0
        print(alertController.view.bounds.width)
        pv.frame = CGRect(x:0 ,y: 50,width: alertController.view.frame.width  ,height: 150)
        pv.autoresizingMask = [.flexibleWidth]

        // pv.backgroundColor = UIColor.blackColor()
        pv.dataSource = alertPicker
        pv.delegate = alertPicker
        
                
        alertController.view.addSubview(pv)
        target.addChildViewController(alertPicker)
        alertPicker.didMove(toParentViewController: target)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        target.present(alertController, animated: true, completion: nil)
        
      //  applyFont(obj: okAction, txt: okstring, TitleOrMessage: nil, fontsize: 15)
       // applyFont(obj: cancelAction, txt: cancelstring, TitleOrMessage: nil, fontsize: 15)
       
        pv.reloadAllComponents()
    }
    
    // MARK: - PickerView DataSource -
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsPickerView.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return itemsPickerView[row].Val
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: UIConstants.AppFonts.LightName, size: label.font.pointSize)
        
        // where data is an Array of String
        label.text = itemsPickerView[row].Val
        
        return label
    }
    
    //MARK: - PickerView Delegate -
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerViewItem = row
        print("\(itemsPickerView[row].Val)")
    }
    
    //MARK: apply fonts 
    static func applyFont(obj:NSObject,txt:String,TitleOrMessage:Bool?,fontsize:CGFloat) {
        let messageFont = [NSFontAttributeName: UIFont(name: UIConstants.AppFonts.LightName, size: fontsize)!]
       
        let attributedText = NSMutableAttributedString(string: txt, attributes: messageFont)
        
        if let TitleOrMessage = TitleOrMessage {
            obj.setValue(attributedText, forKey: TitleOrMessage ? "attributedTitle" : "attributedMessage")
        } else {   //
            // this has to be set after presenting the alert, otherwise the internal property __representer is nil
//            obj.value(forKey: <#T##String#>)
            guard let label = (obj.value(forKey:"__representer") as AnyObject).value(forKey:"label") as? UILabel else { return }
            label.attributedText = attributedText
        }
    }
    
    
}
