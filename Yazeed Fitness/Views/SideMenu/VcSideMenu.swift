//
//  VcSideMenu.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/25/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//


import UIKit
import Kingfisher

var sideMenu :VcSideMenu!


class VcSideMenu: UIViewController {
    
    //MARK: - Outlets -
    @IBOutlet weak var TableVeiw: TableViewAdapter!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var coverView: UIView!
    
    
    //MARK: - Propreties -
    var sidemenuItems:[CcSideMenu.sideMenuItem] = []
    
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        
        SetupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateUserData()
    }
    //MARK: - Side Menu -
    func SetupViews() {
        
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_home"), selectedIcon_:#imageLiteral(resourceName: "ic_homeActive"), label_: "الرئيسية"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_department_unactive"), selectedIcon_:#imageLiteral(resourceName: "ic_departmentActive"), label_:"الأقسام"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_doctor"), selectedIcon_:#imageLiteral(resourceName: "ic_doctor_active"), label_:"الأطباء"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_share_app"), selectedIcon_:#imageLiteral(resourceName: "ic_share_active"), label_:"مشاركة التطبيق"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_about_unactive"), selectedIcon_:#imageLiteral(resourceName: "ic_about_active"), label_:"من نحن"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_contact_us"), selectedIcon_:#imageLiteral(resourceName: "ic_contact_us_active"), label_:"اتصل بنا"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:#imageLiteral(resourceName: "ic_logout"), selectedIcon_:#imageLiteral(resourceName: "ic_logoutActive"), label_:"تسجيل خروج"))
        
        
        TableVeiw.setup(cell: "CcSideMenu", data: sidemenuItems, cell_Height: 44, AL_Height: nil) { (cell, index) in
            self.SideMenuCellsSetup(cell: cell as! CcSideMenu, index: index)
        }
        let indexPath = IndexPath(row: 0, section: 0)
        TableVeiw.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)

    }
    
    func SideMenuCellsSetup(cell:CcSideMenu, index:IndexPath) {
       let item = sidemenuItems[index.row]
       cell.Setup(data: item)
       
        
    }
    
    //MARK : Helpers
    func  initialization (){
        sideMenu = self
        
        coverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openProfile)))
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openProfile)))
        
    }
    func openProfile(){
        
        present(UIConstants.LoginStory.instantiateViewController(withIdentifier: "VcRegister"), animated: true, completion: nil)
    }
    func populateUserData()
    {
        userNameLabel.text = PrLogin.UserName
        emailLabel.text  = PrLogin.Email
        //profileImage.kf.setImage(with: URL(string: (NetworkConstants.baseImageURL + PrLogin.Image)))
        var imageUrl : String! = ""
        if PrLogin.Image != nil {
            imageUrl = PrLogin.Image
        }
        if let url = URL(string:  NetworkConstants.baseUserImageURL + imageUrl)
        {
            styles.BorderRad(targets: profileImage, Radus: profileImage.frame.width / 2, borderWidth: 0, BorderColor: UIColor.white)
            profileImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_pic"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    func handleMenuSelection(row:Int){
        switch row{
        case 0 :
            
            break
        case 1 :
            HomeScreen.navigationController?.pushViewController((UIConstants.DepartmentsStory.instantiateViewController(withIdentifier: UIConstants.Screens.Deps)), animated: true)
            break
        case 2 :
            HomeScreen.navigationController?.pushViewController((UIConstants.DoctorsStory.instantiateViewController(withIdentifier: UIConstants.Screens.Doctors)), animated: true)
            break
        case 3 :
            shareApp()
            break
        case 4 :
            self.present(UIConstants.AboutUsStory.instantiateViewController(withIdentifier: UIConstants.Screens.AboutUs), animated: true)
            break
        case 5 :
            self.present(UIConstants.ContactUsStory.instantiateViewController(withIdentifier: UIConstants.Screens.ContactUs), animated: true)
            break
        case 6 :
            logOut()
            break
        default :
            break
            
            
        }
        toggleSWRevealViewController()
    }
    func logOut(){
        
        self.present(UIConstants.LoginStory.instantiateViewController(withIdentifier: "Vclogout"), animated: true, completion: nil)
    }
    func shareApp() {
        
        let vc = UIActivityViewController(activityItems: ["", ], applicationActivities: [])
        // exclude
        vc.excludedActivityTypes = [
            UIActivityType.assignToContact,
            UIActivityType.print,
            UIActivityType.addToReadingList,
            UIActivityType.saveToCameraRoll,
            UIActivityType.openInIBooks,
            UIActivityType.copyToPasteboard,
            UIActivityType(rawValue: "com.apple.reminders.RemindersEditorExtension"),
            UIActivityType(rawValue: "com.apple.mobilenotes.SharingExtension")]
        
        self.present(vc, animated: true)
    }

    
}









