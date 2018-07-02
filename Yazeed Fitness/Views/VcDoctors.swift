//
//  VcDoctors.swift
//  Yazeed Fitness
//
//  Created by Hadeer on 24/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class VcDoctors: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var doctorsTableView: UITableView!
    //MARK: - Properties -
    var doctorsList: Doctors! = nil
    //MARK: - Contoller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        Style()
        doctorsTableView.register(UINib(nibName: "DoctorCell", bundle: nil), forCellReuseIdentifier: "DoctorCell")

        SetupTableView()
     
    }
    //MARK: - UIStyle -
    func Style(){
        self.navigationItem.title = "الاطباء"
       
    }
    //MARK: - Helpers -
    func SetupTableView(){
        if doctorsList == nil {
        PrDoctors.getDoctors(){ (success ,message ,doctors) in
            if success {
                self.doctorsList = doctors
                self.doctorsTableView.reloadData()
            }else{
                showMessageBanner(title: message, subTitle: "", error: true)
            }
        }
        }else if doctorsList.doctors.count == 0{
            showMessageBanner(title: Messages.Doctors.NoDoctors,  error: false)
           
            self.navigationController?.popViewController(animated: false)
        }

    }
   /* func populateTableOfDoctors(){
        doctorsTableView.setup(cell:"DoctorCell",data: doctorsList.doctors , cell_Height:70,AL_Height:nil)
           { (cell, index) in
              self.doctorCellsSetup(cell: cell as! DoctorCell, index: index)
         }
    }*/
    func doctorCellsSetup(cell:DoctorCell, index:IndexPath) {
        let item = doctorsList.doctors[index.row]
        cell.Setup(data: item)
        
        
    }
}
extension VcDoctors : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if doctorsList != nil {
            return doctorsList.doctors.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"DoctorCell")! as! DoctorCell
        cell.Setup(data: doctorsList.doctors[indexPath.row])
        return cell
    }
}
