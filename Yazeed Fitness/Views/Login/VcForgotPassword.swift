//
//  VcForgotPassword.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit
import MBProgressHUD

class VcForgotPassword: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var viewCont: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    //MARK: - properties
     var loadingSpinner = MBProgressHUD()
     var sendPressed = false
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if sendPressed {
            self.btnSend.setTitle("إعاده إرسال رابط التفعيل", for: .normal)
        }
    }
    //MARK: - UIStyle -
    func style() {
        viewCont.borderRad(Radus: 25, borderWidth: 0)
        btnSend.borderRad(Radus: 5, borderWidth: 2 , BorderColor: UIConstants.Colors.heavyBlue)
        btnLogin.borderRad(Radus: 5, borderWidth: 0 )
        btnSend.setTitle("إرسال رابط التفعيل", for: .normal)
        
      //  txtEmail.borderRad(Radus: <#T##CGFloat#>, borderWidth: <#T##CGFloat#>)
    }
    //MARK: -Buttons Actions -
    @IBAction func didTapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapLoginButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func didTapSendButton(_ sender: Any) {
        if ValidationUtil.isValidEmail(testStr:txtEmail.text!) {
        loadingSpinner = MBProgressHUD.customInit(forview: view, lable: "")
        DalLogin.ForgetPassword(email: txtEmail.text!){ (responseState , message) in
              self.loadingSpinner.hide(animated: true)
            if responseState == .Success {
            
                self.sendPressed = true
                self.btnSend.setTitle("إعاده إرسال رابط التفعيل", for: .normal)
                self.present((self.storyboard?.instantiateViewController(withIdentifier: "VcForgetPasswordPopup"))!, animated: true, completion: nil)
                
            }else{
                showMessageBanner(title: message,  error: true)
            }
            
        }
        }else{
            showMessageBanner(title:   Messages.REG_Validation.Email, error: true)
        }
    }
    

}
