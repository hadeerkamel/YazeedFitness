//
//  VcSuccessRegistraion.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 22/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcSuccessRegistraion: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissVC)))
        // Do any additional setup after loading the view.
    }
    //MARK: Style
    func style(){
        successView.borderRad(Radus: successView.frame.size.width/2, borderWidth: 0)
        okButton.borderRad(Radus: 5, borderWidth: 0)
        popUpView.borderRad(Radus: 5, borderWidth: 0)
    }

     //MARK : - Buttons Actions -
    @IBAction func didTapActivateAcount(_ sender: Any) {
       /* let mailURL = URL(string: "message://")!
        if UIApplication.shared.canOpenURL(mailURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
        }*/
        present((self.storyboard?.instantiateViewController(withIdentifier: UIConstants.Screens.LOGIN))!, animated: true, completion: nil)
        
    }
    
}
