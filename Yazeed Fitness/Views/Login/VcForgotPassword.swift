//
//  VcForgotPassword.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit

class VcForgotPassword: UIViewController {

    @IBOutlet weak var viewCont: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        // Do any additional setup after loading the view.
    }
    
    func style() {
        viewCont.borderRad(Radus: 10, borderWidth: 0)
        btnSend.borderRad(Radus: 3, borderWidth: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
