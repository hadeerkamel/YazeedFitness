//
//  CTxt_Icon_Underline.swift
//  Mahir_Client
//
//  Created by Mohamed Hashem on 9/17/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import UIKit


enum CTextModes:Int {
    case Normal = 1
    case SecureTxt = 2
    case FullyClickableNoEdit = 3
}
enum CTextAcceptedContent:Int {
    case AnyText = 1
    case TextOnly = 2
    case NumbersOnly = 3
}

@IBDesignable class CTxt_Icon_Underline: UIView , UITextFieldDelegate{
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet var constFullTxt: NSLayoutConstraint!
    
    @IBOutlet weak var imgLeftIcon: UIImageView!
    @IBOutlet weak var imgRightIcon: UIImageView!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var viewUnderLine: UIView!
    
    @IBOutlet weak var btnFullView: UIButton!
    
    var Accepts:CTextAcceptedContent = .AnyText
    
    var text :String! {
        get { return txtField.text }
        set { txtField.text = newValue }
    }
    
    @IBInspectable private var InspectText:String! {
        didSet {
            txtField.text = InspectText
        }
    }
    @IBInspectable var placeHolder:String! {
        didSet {txtField.placeholder = placeHolder}
    }
    @IBInspectable var leftIcon:UIImage! {
        didSet {
            imgLeftIcon.image = leftIcon
        }
    }
    @IBInspectable var ShowTxt_Icon:UIImage! {
        didSet {
            imgLeftIcon.image = leftIcon
        }
    }
    @IBInspectable var HideTxt_Icon:UIImage! {
        didSet {
            // imgLeftIcon.image = leftIcon
        }
    }
    @IBInspectable var underLineColor:UIColor! {
        didSet {
            viewUnderLine.backgroundColor = underLineColor
        }
    }
    @IBInspectable var isSecure:Bool = false {
        didSet{ applySelectedMode() }
    }
    @IBInspectable var isFullClickable :Bool = false {
        didSet{ applySelectedMode() }
    }
    @IBInspectable var maxLength :Int = 0
    
//    @IBInspectable var txtFont :UIFont! {
//        didSet{ txtField.font = txtFont}
//    }
    
    // MARK Handlers
    
    var fullViewClicked:(()->())?
    var textChanged:(()->())? {
        didSet {
            if textChanged != nil {
                txtField.addTarget(self, action: #selector(textchanged), for: .editingChanged)
            } else {
                txtField.removeTarget(self, action: #selector(textchanged), for: .editingChanged)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
        applySelectedMode()
    }
    
    func commonInit() {
        xibSetup(xibName:String(describing: type(of:self)))// "CTxt_Icon_Underline"
        txtField.delegate = self
    }
    
    func textchanged() {
        textChanged?()
    }
    
    func xibSetup(xibName: String) {
        
        let view = loadViewFromNib(xibName: xibName)
        view.frame = bounds
        // Make the view stretch with containing view
        // view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    func applySelectedMode() {
        
        secureMode(enable: false)
        btnFullView.isHidden = true
        
        // calculate the mode from Bools since enums is not suported in @IBinspectables :(
        var Mode = CTextModes.Normal
        if isSecure { Mode = .SecureTxt }
        else if isFullClickable { Mode = .FullyClickableNoEdit }
        
        switch Mode {
        case .Normal:
            
            break
        case .SecureTxt:
            secureMode(enable: true)
            break
        case .FullyClickableNoEdit:
            btnFullView.isHidden = false
            break
//        default:
//            break
        }
    }
    
    func secureMode(enable:Bool) {
        
        if enable {
            imgRightIcon.isHidden = false
            btnRight.isHidden = false
            constFullTxt.isActive = false
            
            txtField.isSecureTextEntry = true
            imgRightIcon.image = ShowTxt_Icon
        } else {
            imgRightIcon.isHidden = true
            btnRight.isHidden = true
            constFullTxt.isActive = true
            constFullTxt.constant = 0
            txtField.isSecureTextEntry = false
        }
    }
    
    @IBAction func btnRightClicked(_ sender: Any) {
        if txtField.isSecureTextEntry {
            txtField.isSecureTextEntry = false
            imgRightIcon.image = HideTxt_Icon
        } else {
            txtField.isSecureTextEntry = true
            imgRightIcon.image = ShowTxt_Icon
        }
    }
    
    @IBAction func FullViewClicked(_ sender: Any) {
        fullViewClicked?()
    }
    
    // delegates
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" { return true }
        
        return CTxt_Icon_Underline.validateAcceptedTxt(textField, Accepts: Accepts, shouldChangeCharactersIn: range, replacementString: string)
        && CTxt_Icon_Underline.ValidateMaxLength(textField,max: maxLength ,shouldChangeCharactersIn: range, replacementString: string)
    }
    static func validateAcceptedTxt(_ textField: UITextField,Accepts:CTextAcceptedContent, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        // validate accepted text type
        if Accepts == .NumbersOnly {
            return ValidationUtil.validateNumbersOnly(input: string)
        } else if Accepts == .TextOnly {
            return ValidationUtil.validateCharacterAlphabetOnly(input: string)
        }
        return true
    }
    static func ValidateMaxLength(_ textField: UITextField, max:Int, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // validate length
        if max == 0 {return true}
        else {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= max // Bool
        }
        
    }
    
}











