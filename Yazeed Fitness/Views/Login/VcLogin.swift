//
//  VcLogin.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/27/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit

class VcLogin: UIViewController {

    @IBOutlet weak var viewCont: UIView!
    @IBOutlet weak var CtextEmail: CTxt_Icon_Underline!
    @IBOutlet weak var CtextPassword: CTxt_Icon_Underline!
    
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var butnLogin: UIButton!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Style()
    }

    func Style() {
        viewCont.borderRad(Radus: 10, borderWidth: 0)
        butnLogin.borderRad(Radus: 3, borderWidth: 0)
        btnRegister.borderRad(Radus: 3, borderWidth: 2,BorderColor: UIConstants.Colors.heavyBlue)
        
        let forgetPass=NSAttributedString(string: NSLocalizedString("نسيت كلمة المرور؟", comment: "forgot pass")
            , attributes: [NSUnderlineStyleAttributeName:true,NSForegroundColorAttributeName:UIColor.darkGray])
        btnForgotPass.setAttributedTitle(forgetPass, for: .normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    

}
