//
//  VcContactUs.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 23/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcContactUs: UIViewController,UITextViewDelegate {

    //MARK: - Outlets
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var subjectTextFeild: UITextField!
    @IBOutlet weak var messageBodyTextVeiw: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        style()
        populateUserData()
    }
    //MARK: - UIStyle -
    func style(){
        sendButton.borderRad(Radus: 5, borderWidth: 0)
        
    }
    //MARK: - Helpers -
    func populateUserData(){
        userNameLabel.text = PrLogin.UserName
        emailLabel.text = PrLogin.Email
    }
    func initialization(){
        messageBodyTextVeiw.delegate = self
    }
    //MARK: - UITextVeiw
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "الرسالة..."
            textView.textColor = UIColor.lightGray
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black
        
    }
    //MARK: - Buttons Actions
    @IBAction func didTapSendButton(_ sender: Any) {
        PrContactUs.ContactUs(subject: subjectTextFeild.text!, messageBody: messageBodyTextVeiw.text){
            (success,message)in
            if success{
                showMessageBanner(title: message, error: false)
            }else{
                showMessageBanner(title: message, error: true)
            }
        }
    }
    @IBAction func didTapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
