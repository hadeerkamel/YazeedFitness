//
//  VcHome.swift
//  Yazeed Fitness
//
//  Created by Hadeer kamel on 8/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

//MARK: - global refrence -
var HomeScreen : VcHome!

class VcHome: UIViewController,UISearchBarDelegate {

    //MARK: - Outlets -
    @IBOutlet weak var registerdWeightLabel: UILabel!
    @IBOutlet weak var weeklyWeightLabel: UILabel!
    @IBOutlet weak var registerdWeightView: UIView!
    @IBOutlet weak var weeklyWeightView: UIView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var homeNavigationBar: UINavigationBar!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var coverHomeView: UIView!
    
    //MARK: - Properties -
    var searchTextfield : UITextField!
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        initialization()
        populateUserData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //MARK: Navigation Controller
    func  navigationBarStyle() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
       // backItem.image = #imageLiteral(resourceName: "backRight")
        self.navigationItem.backBarButtonItem = backItem
        let attributes = [NSFontAttributeName: UIFont(name: "CoconNextArabic-Light", size: 17)! , NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    
    }
    //MARK: - UIStyle -
    func style(){
        registerdWeightView.borderRad(Radus: 10, borderWidth: 0.5, BorderColor: UIColor.lightGray)
        weeklyWeightView.borderRad(Radus: 10, borderWidth: 0.5, BorderColor: UIColor.lightGray)
        homeSearchBar.borderRad(Radus: 20, borderWidth: 0)
        for subview in homeSearchBar.subviews[0].subviews{
            if subview.isKind(of: UITextField.self){
                subview.borderRad(Radus: 15, borderWidth: 0)
                searchTextfield = subview as! UITextField
                
                
                break
            }
        }
        homeSearchBar.setImage(#imageLiteral(resourceName: "ic_search"), for: .search, state: .normal)
        
        /*let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.getSearchResulte))
        searchTextfield.rightView?.addGestureRecognizer(tapGesture)*/
        
        UIApplication.shared.statusBarView?.backgroundColor = UIConstants.Colors.heavyBlue
        navigationBarStyle()
        
    }
    //MARK: - SearchBar -
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getSearchResulte()
        self.view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    func getSearchResulte (){
        PrHome.SearchDoctors(specialty: searchTextfield.text!){  (success, message, doctors) in
            if success {
                let VC = UIConstants.DoctorsStory.instantiateViewController(withIdentifier: UIConstants.Screens.Doctors) as! VcDoctors
                VC.doctorsList = doctors
                HomeScreen.navigationController?.pushViewController(VC, animated: true)
            }else{
                showMessageBanner(title: message, error: true)
            }
            
            
            
        }
    }
    //MARK: - Helpers -
    func initialization(){
        HomeScreen = self
        self.homeSearchBar.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openCloseSideMenu))
        coverHomeView.addGestureRecognizer(tap)
        
    }
    func populateUserData()
    {
        registerdWeightLabel.text = PrLogin.RegisterdWeight
        weeklyWeightLabel.text = PrLogin.CurrentWeight
    }
    func openCloseSideMenu(_ sender: Any){
        if self.revealViewController() != nil{
            self.revealViewController().rightRevealToggle(sender)
             coverHomeView.isHidden = !coverHomeView.isHidden
        }
       
    }
    //MARK: - Button Actions -
    @IBAction func didTapEditWeeklyWeight(_ sender: Any) {
        self.present( storyboard!.instantiateViewController(withIdentifier: UIConstants.Screens.EditWeightPopUp ), animated: true)
        
    }
    @IBAction func didTapSideMenuButton(_ sender: Any) {
        homeSearchBar.text = nil
        homeSearchBar.endEditing(true)
        openCloseSideMenu(sender)
        

    }
  
    
    
}
