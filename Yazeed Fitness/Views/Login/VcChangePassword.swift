//
//  VcChangePassword.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 21/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcChangePassword: UIViewController {

    //MARK: - Outlets -
    @IBOutlet weak var currentPassTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    @IBOutlet weak var confirmNewPassTextField: UITextField!
    
    @IBOutlet weak var currentPassView: UIView!
    @IBOutlet weak var newPassView: UIView!
    @IBOutlet weak var confirmPassView: UIView!
    
    @IBOutlet weak var firstShow: UIButton!
    @IBOutlet weak var secondShow: UIButton!
    @IBOutlet weak var thirdShow: UIButton!
    
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - Controller Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissVC)))
    }
    //MARK: - Style -
    func style(){
        currentPassView.borderRad(Radus: 3, borderWidth: 0.5,BorderColor: UIColor.lightGray)
        newPassView.borderRad(Radus: 3, borderWidth: 0.5,BorderColor: UIColor.lightGray)

        confirmPassView.borderRad(Radus: 3, borderWidth: 0.5,BorderColor: UIColor.lightGray)

        
        contentView.borderRad(Radus: 3, borderWidth: 0)
        confirmButton.borderRad(Radus: 3, borderWidth: 0)
        cancelButton.borderRad(Radus: 3, borderWidth: 0)
    }
    //MARK: - Buttons Actions -
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapUpdateButton(_ sender: Any) {
        if (newPassTextField.text?.characters.count)! < 6{
             showMessageBanner(title: Messages.REG_Validation.Passwordlength, error: true)
            return
        }
        
        if newPassTextField.text == confirmNewPassTextField.text {
            PrLogin.changePassword(oldPassword: currentPassTextField.text!, newPassword: newPassTextField.text!){(success,message) in
                if success{
                    showMessageBanner(title: message, error: false)
                    self.dismiss(animated: true, completion: nil)
                   
                }else{
                    showMessageBanner(title: message, error: true)
                }
                
            }
        }else{
            showMessageBanner(title: Messages.REG_Validation.RepaetPassword, error: true)
        }
    }
    @IBAction func currentShowPass(_ sender: Any) {
        if currentPassTextField.isSecureTextEntry {
           setActive(button: firstShow)
        }else{
           setUnActive(button: firstShow)
        }
        currentPassTextField.isSecureTextEntry = !currentPassTextField.isSecureTextEntry
    }
    @IBAction func newShowPass(_ sender: Any) {
        if newPassTextField.isSecureTextEntry {
            setActive(button: secondShow)
        }else{
            setUnActive(button: secondShow)
        }
        newPassTextField.isSecureTextEntry = !newPassTextField.isSecureTextEntry
    }
    @IBAction func confirmShowPass(_ sender: Any) {
        if confirmNewPassTextField.isSecureTextEntry {
            setActive(button: thirdShow)
        }else{
            setUnActive(button: thirdShow)
        }
        confirmNewPassTextField.isSecureTextEntry = !confirmNewPassTextField.isSecureTextEntry
    }
    //MARK: - Helpers -
    func setActive(button:UIButton){
        button.setBackgroundImage(#imageLiteral(resourceName: "show_password_active"), for: .normal)
    }
    func setUnActive(button:UIButton){
        button.setBackgroundImage(#imageLiteral(resourceName: "show_password_unactive"), for: .normal)
    }

}
