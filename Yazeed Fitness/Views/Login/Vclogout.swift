//
//  Vclogout.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 22/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class Vclogout: UIViewController {

    //MARK: - Outltes -
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissVC)))
        // Do any additional setup after loading the view.
    }
    //MARK: - Style -
    func style(){
        popUpView.borderRad(Radus: 5, borderWidth: 0)
        yesButton.borderRad(Radus: 5, borderWidth: 0)
        noButton.borderRad(Radus: 5, borderWidth: 0)
    }
    //MARK: - Buttons Actions -
    @IBAction func didTapOkButton(_ sender: Any) {
        PrLogin.logOut(){(success , message)in
            if success{
             
               self.present(UIConstants.LoginStory.instantiateViewController(withIdentifier: "VcLogin"), animated: true, completion: nil)
                
            }else{
                showMessageBanner(title: message)
            }
            
        }
    }
    @IBAction func didTapNoButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
