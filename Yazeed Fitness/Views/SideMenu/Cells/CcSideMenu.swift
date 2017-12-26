//
//  CcSideMenu.swift
//  Yazeed Fitness
//
//  Created by Mohamed Hashem on 12/25/17.
//  Copyright © 2017 googansolutions. All rights reserved.
//

import UIKit

class CcSideMenu: UITableViewCell {

    class sideMenuItem {
        var icon:UIImage!
        var selctedIcon:UIImage!
        var label:String = ""
        
        init(icon_:UIImage,selectedIcon_:UIImage,label_:String) {
            icon = icon_
            selctedIcon = selectedIcon_
            label = label_            
        }
    }
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblDescreption: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func Setup(data:sideMenuItem) {
        
    }
    
}
