//
//  VcSideMenu.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/25/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import Foundation
import UIKit

class VcSideMenu: UIViewController {
    
    
    @IBOutlet weak var TableVeiw: TableViewAdapter!
    
    var sidemenuItems:[CcSideMenu.sideMenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func SetupViews() {
        
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_: UIImage(), selectedIcon_: UIImage(), label_: "الرئسية"))//(UIImage(),UIImage(),))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"الأقسام"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"الأطباء"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"مشاركة التطبيق"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"من نحن"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"اتصل بنا"))
        sidemenuItems.append(CcSideMenu.sideMenuItem(icon_:UIImage(), selectedIcon_:UIImage(), label_:"تسجيل الخروج"))
        
        
        TableVeiw.setup(cell: "CcSideMenu", data: sidemenuItems, cell_Height: 44, AL_Height: nil) { (cell, index) in
            self.SideMenuCellsSetup(cell: cell as! CcSideMenu, index: index)
        }
        
    }
    
    func SideMenuCellsSetup(cell:CcSideMenu, index:IndexPath) {
       let item = sidemenuItems[index.row]
       cell.Setup(data: item)
       
        
    }
    
}









