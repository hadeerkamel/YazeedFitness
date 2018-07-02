//
//  VcAboutUs.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit
import MBProgressHUD

class VcAboutUs: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var aboutUsView: UIView!
    @IBOutlet weak var aboutUsTextLabel: UILabel!
    //MARK: - Properties -
    var aboutUsData:AboutModel? = nil
    var loadingSpinner = MBProgressHUD()

    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        populateScreen()
    }
    //MARK: - UIStyle -
    func style(){
        aboutUsView.borderRad(Radus: 25, borderWidth: 0)
    }
    //MARK: - Helpers -
    func populateScreen(){
        loadingSpinner = MBProgressHUD.customInit(forview: view, lable: "")
        PrAboutUs.getAbout(){(success,message,obj) in
            self.loadingSpinner.hide(animated: true)
            if success {
                self.aboutUsData = obj
                self.reloadView()
            }else{
                showMessageBanner(title: message, error: true)
            }
        }
    }
    func reloadView(){
        aboutUsTextLabel.text = aboutUsData?.discription
    }
    func openUrl(url:String){
        let application = UIApplication.shared
        if application.canOpenURL(NSURL(string: url)! as URL) {
            application.openURL(NSURL(string: url)! as URL)
            return
        }
    }
    //MARK: - Buttons Actions -
    @IBAction func didTapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapInstagramButton(_ sender: Any) {
        
        openUrl(url: (aboutUsData?.instagram)!)
    }
    @IBAction func didTapBehanceButton(_ sender: Any) {
        openUrl(url:  (aboutUsData?.behance)!)
    }
    @IBAction func didTapPeinterestButton(_ sender: Any) {
        openUrl(url: (aboutUsData?.pinterest)!)
    }
    @IBAction func didTapLinkedInButton(_ sender: Any) {
        openUrl(url: (aboutUsData?.linkedin)!)
    }
    @IBAction func didTapSnapButton(_ sender: Any) {
        openUrl(url: (aboutUsData?.snap)!)
    }
  
   
    
}
