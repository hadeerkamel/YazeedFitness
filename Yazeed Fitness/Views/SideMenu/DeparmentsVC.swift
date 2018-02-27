//
//  DeparmentsVC.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class DeparmentsVC: UIViewController {
 
    //MARK: - Outlets -
    @IBOutlet weak var depsTableView: UITableView!
    //MARK: - Properties -
    var  departmentsData: Departments! = nil
    
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        Style()
    }
    //MARK: - UIStyle -
    func Style(){
        self.navigationItem.title = "الاقسام"
        
    }
    //MARK: - Helpers -
    func initialization(){
        
        depsTableView.register(UINib(nibName: "DepCell", bundle: nil), forCellReuseIdentifier: "DepCell")
        setupTableView()
    }
    func setupTableView(){
        PrDepartments.getDepartments { (success, mess, depsList) in
            if success {
                self.departmentsData = depsList
                self.depsTableView.reloadData()
            }else{
                showMessageBanner(title: mess, subTitle: "", error: true)
            }
        }
    }

}
extension DeparmentsVC :UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if departmentsData != nil{
            return departmentsData.array.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepCell")! as! DepCell
        cell.Setup(Data: departmentsData.array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: UIConstants.Screens.DepDetails) as! DepDetailsVC
        VC.depData = departmentsData.array[indexPath.row]
        //self.present(VC, animated: true, completion: nil)
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
