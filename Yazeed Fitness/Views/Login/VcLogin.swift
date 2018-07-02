//
//  VcLogin.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit
import MBProgressHUD

class VcLogin: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewCont: UIView!
    @IBOutlet weak var CtextEmail: CTxt_Icon_Underline!
    @IBOutlet weak var CtextPassword: CTxt_Icon_Underline!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var butnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    // MARK: - Properties
    var loadingSpinner = MBProgressHUD()
    
    // MARK: - Controller Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Style()
    }
    
    // MARK: - UIStyle

    func Style() {
        viewCont.borderRad(Radus: 25, borderWidth: 0)
        butnLogin.borderRad(Radus: 5, borderWidth: 0)
        btnRegister.borderRad(Radus: 5, borderWidth: 2,BorderColor: UIConstants.Colors.heavyBlue)
        
        let forgetPass=NSAttributedString(string: NSLocalizedString("هل نسيت كلمة المرور؟", comment: "forgot pass")
            , attributes: [NSUnderlineStyleAttributeName:true,NSForegroundColorAttributeName:UIColor.darkGray])
        btnForgotPass.setAttributedTitle(forgetPass, for: .normal)
        CtextEmail.txtField.keyboardType = .emailAddress
        
    }
    
    // MARK: - Buttons Actions -

    @IBAction func didTapRegisterButton(_ sender: Any) {
       self.present( storyboard!.instantiateViewController(withIdentifier: UIConstants.Screens.Register ), animated: true)
    }
    @IBAction func didTapForgetPassButton(_ sender: Any) {
       self.present( storyboard!.instantiateViewController(withIdentifier: UIConstants.Screens.ForgotPassword ), animated: true)

    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let validationMessage = PrLogin.validateLoginData(email: CtextEmail.text, password: CtextPassword.text)
        if validationMessage == "" {
            loadingSpinner = MBProgressHUD.customInit(forview: view, lable: "")
            PrLogin.login(email: CtextEmail.text, password: CtextPassword.text){ (success ,message) in
                self.loadingSpinner.hide(animated: true)
                if success  {
                    self.dismiss(animated: true, completion: nil)
                   // self.present(UIConstants.HomeStory.instantiateInitialViewController()!, animated: true, completion: nil)
                    let _ = AppDelegate.RoutToScreen(storyBoard: UIConstants.SideMenuStory, screen: "HomeInit", WithNav:  false)
                }else{
                    showMessageBanner(title: message, error: true)
                }
                
            }
        }else{
            showMessageBanner(title: validationMessage, error: true)
        }
        
    }
    
    

}


