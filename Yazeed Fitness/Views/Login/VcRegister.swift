//
//  VcRegister.swift
//  Yazeed Fitness
//
//  Created by HadeerKamel on 31/12/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit
import MBProgressHUD

class VcRegister: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{
    
    // MARK: - Outlets -
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameTextField: CTxt_Icon_Underline!
    @IBOutlet weak var emailTextField: CTxt_Icon_Underline!
    @IBOutlet weak var birthDateTextField: CTxt_Icon_Underline!
    @IBOutlet weak var heightTextField: CTxt_Icon_Underline!
    @IBOutlet weak var currentWeightTextField: CTxt_Icon_Underline!
    @IBOutlet weak var idealWeightTextField: CTxt_Icon_Underline!
    @IBOutlet weak var passwordTextField: CTxt_Icon_Underline!
    @IBOutlet weak var repeatPassTextField: CTxt_Icon_Underline!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var editProfileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var inStackView: UIView!
    
    //MARK: - Properties -
    
    var imgPicker = UIImagePickerController()
    var loadingSpinner = MBProgressHUD()
    var currentDate = Date()
    var userBirthDate = Date()
    var userPickedBirthDate = false
    var userPickedImage = false
    
    // MARK: - controller life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        addProfileImagegesture()
        initialisations()
        if ISLoged {
            handleUpdateModeUI()
        }else{
            handleRegiterModeUI()
        }
        
    }
    
    //MARK: - UIStyle -
    func style(){
        registerButton.borderRad(Radus: 5, borderWidth: 0)
        changePasswordButton.borderRad(Radus: 5, borderWidth: 1, BorderColor: UIConstants.Colors.heavyBlue)
        UIApplication.shared.statusBarView?.backgroundColor = UIConstants.Colors.heavyBlue
        
       // inStackView.frame.size = CGSize(width: self.view.frame.size.width, height: 730)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 730)
    }
    
    //MARK: - Helpers -
    
    func initialisations(){
        imgPicker.delegate = self
        profileImage.isUserInteractionEnabled = true
       /* birthDateTextField.txtField.addTarget(self, action: #selector(VcRegister.didTapBirthDateTextField), for: UIControlEvents.touchDown)*/
       /* birthDateTextField.txtField.addTarget(self, action: #selector(VcRegister.didTapBirthDateTextField), for: UIControlEvents.allTouchEvents)*/
        
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(VcRegister.didTapBirthDateTextField))
       // birthDateTextField.addGestureRecognizer(tapGesture)
       //  birthDateTextField.superview?.addGestureRecognizer(tapGesture)
        
        //Keyboard style
        emailTextField.txtField.keyboardType = .emailAddress
        heightTextField.txtField.keyboardType = .numberPad
        idealWeightTextField.txtField.keyboardType = .numberPad
        currentWeightTextField.txtField.keyboardType = .numberPad
        
        birthDateTextField.txtField.delegate = self
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        didTapBirthDateTextField()
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    func addProfileImagegesture(){
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.PickIMG)))
    }
    
    func handleUpdateModeUI(){
        editProfileImage.isHidden = false
        passwordTextField.removeFromSuperview()
        repeatPassTextField.removeFromSuperview()
        changePasswordButton.isHidden = false
        titleLabel.isHidden = true
        //add locks
        populateUserProfile()
        heightTextField.isUserInteractionEnabled = false
        currentWeightTextField.isUserInteractionEnabled = false
        idealWeightTextField.isUserInteractionEnabled = false
        registerButton.setTitle("تأكيد تغير البيانات", for: .normal)
        
        
    }
    func handleRegiterModeUI(){
        editProfileImage.isHidden = true
        changePasswordButton.isHidden = true
        //remove locks
        
    }
    func populateUserProfile()
    {
        if let url = URL(string:  NetworkConstants.baseUserImageURL + PrLogin.Image)
        {
            styles.BorderRad(targets: profileImage, Radus: profileImage.frame.width / 2, borderWidth: 0, BorderColor: UIColor.white)
            profileImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_pic"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        usernameTextField.txtField.text = PrLogin.UserName
        emailTextField.txtField.text = PrLogin.Email
        birthDateTextField.txtField.text = PrLogin.Age
        heightTextField.txtField.text = PrLogin.Height
        currentWeightTextField.txtField.text = PrLogin.CurrentWeight
        idealWeightTextField.txtField.text = PrLogin.IdealWeight
        
        heightTextField.txtField.text = heightTextField.txtField.text! + " سم "
        currentWeightTextField.txtField.text = currentWeightTextField.txtField.text! + " ك.ج "
        idealWeightTextField.txtField.text = idealWeightTextField.txtField.text! + " ك.ج "
    }
    func update(){
        let validationMessage = PrLogin.validateUpdateProfileData(username: usernameTextField.text, email: emailTextField.text, ageText: birthDateTextField.txtField.text!, height:  heightTextField.text, currentWeight: currentWeightTextField.text, idealWeight: idealWeightTextField.text)
        if validationMessage == ""{
            loadingSpinner = MBProgressHUD.customInit(forview: view, lable: "")
            PrLogin.updateProfile(name: usernameTextField.text, email: emailTextField.text, age: birthDateTextField.txtField.text!, currentWeight: PrLogin.CurrentWeight, idealWeight: PrLogin.IdealWeight, height: PrLogin.Height,image: profileImage.image!){
                (success , message) in
                self.loadingSpinner.hide(animated: true)
                if success {
                    showMessageBanner(title: message, error: false)
                }else{
                    showMessageBanner(title: message, error: true)
                }
                
            }
        }else{
            showMessageBanner(title: validationMessage, error: true)
            
        }
    }
    func register(){
        let validationMessage = PrLogin.validateRgestrationData(userPickedImage: userPickedImage, username: usernameTextField.text, email: emailTextField.text, userPickedBirthDate: userPickedBirthDate, height: heightTextField.text ,currentWeight: currentWeightTextField.text, idealWeight: idealWeightTextField.text,password: passwordTextField.text,repeatPass: repeatPassTextField.text)
        
        if validationMessage == ""{
            
            //show spinner
            loadingSpinner = MBProgressHUD.customInit(forview: view, lable: "")
            //prepare data and send the request
            PrLogin.register(username: usernameTextField.text, email: emailTextField.text, birthDate: birthDateTextField.txtField.text!, height: heightTextField.text, currentWeight: currentWeightTextField.text, idealWeight: idealWeightTextField.text, password: passwordTextField.text, profileImage: profileImage.image!){ (success ,message) in
                
                //hide spiner
                self.loadingSpinner.hide(animated: true)
                if success  {
                    self.present((self.storyboard?.instantiateViewController(withIdentifier: "VcSuccessRegistraion"))!, animated: true, completion: nil)
                    //  showMessageBanner(title: message, error: false)
                    //self.dismiss(animated: true, completion: nil)
                }else{
                    showMessageBanner(title: message, error: true)
                }
                
            }
            
        }else{
            showMessageBanner(title: validationMessage, error: true)
            
        }
    

    }

    //MARK: - Pickers -

    func PickIMG()
    {
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            profileImage.image = pickedImage
            userPickedImage = true
            
            styles.BorderRad(targets: profileImage, Radus: profileImage.frame.width / 2, borderWidth: 3, BorderColor: UIColor.white)
        }
        imgPicker.dismiss(animated: true, completion: nil)
    }
    func showDatePicker(){
        AlertDateTimePicker.showAlertWithPicker(target: self,title: "ادخل تاريخ الميلاد", message: "",arabic:true , pickerMode: .date) {
            (selectedDate) in
            if ValidationUtil.validateBirthDate(input: selectedDate){
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                self.birthDateTextField.text = formatter.string(from: selectedDate)
                self.userPickedBirthDate = true
                self.userBirthDate = selectedDate
            }else{
                showMessageBanner(title: Messages.REG_Validation.InvalideBirthDate,  error: true)
            }
        }
    }
    
    //MARK: - Buttons Actions -
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didTapBirthDateTextField(){
        showDatePicker()
    }
    @IBAction func didTapRegisterButton(_ sender: Any) {
        //validate Registration data
        if ISLoged {
            //update
            update()
            
        }else {
            register()
        }
    }
    
    @IBAction func didTapChangePassword(_ sender: Any) {
        present((self.storyboard?.instantiateViewController(withIdentifier: "VcChangePassword"))!, animated: true, completion: nil)
    }
    
}
