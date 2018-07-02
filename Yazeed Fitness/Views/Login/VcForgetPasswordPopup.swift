//
//  VcForgetPasswordPopup.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 17/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcForgetPasswordPopup: UIViewController {

    //MARK: - Outlets -
    
    @IBOutlet weak var OkButton: UIButton!
    @IBOutlet weak var forgetPassimage: UIImageView!
    @IBOutlet weak var popUpView: UIView!
    
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        Style()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissVC)))
        // Do any additional setup after loading the view.
    }
    //MARK: - UIStyle -
    func Style(){
        OkButton.borderRad(Radus: 5, borderWidth: 0)
        popUpView.borderRad(Radus: 5, borderWidth: 0)
    }
    //MARK: - Buttons Actions 
    @IBAction func didTapOkButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
