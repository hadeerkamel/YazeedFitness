//
//  VcEditWeightPopUp.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 9/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcEditWeightPopUp: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var newWeightTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissVC)))
        Style()
    }
    //MARK: - UIStyle -
    func Style(){
        newWeightTextField.text = PrLogin.CurrentWeight
        popUpView.borderRad(Radus: 10, borderWidth: 0)
        editButton.borderRad(Radus: 5, borderWidth: 0)
        cancelButton.borderRad(Radus: 5, borderWidth: 0)
    }
    //MARK: - Button Actions -
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapApplayButton(_ sender: Any) {
        if !PrLogin.validateWeightHeightNumber(numberString: newWeightTextField.text!) {
            showMessageBanner(title: Messages.REG_Validation.InvalideWeight, error: true)
            return
        }
        
        PrHome.updateWeight(newWeight: newWeightTextField.text!){
            (success , mess) in
            if success {
                
                HomeScreen.weeklyWeightLabel.text = self.newWeightTextField.text
                PrLogin.CurrentWeight = self.newWeightTextField.text
                self.dismiss(animated: true, completion: nil)
            }else{
                showMessageBanner(title: mess,error:true)
            }
        }
    }
}
