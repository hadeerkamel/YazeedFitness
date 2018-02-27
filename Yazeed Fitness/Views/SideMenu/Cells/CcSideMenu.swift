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
    var cellData: sideMenuItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            imgIcon.image = cellData.selctedIcon
            lblDescreption.textColor = UIColor.green
        }
        else{
            imgIcon.image = cellData.icon
            lblDescreption.textColor = UIColor.black
        }
        // Configure the view for the selected state
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool){
        super.setHighlighted(highlighted, animated: animated)
      /*  if highlighted {
            imgIcon.image = cellData.selctedIcon
            lblDescreption.textColor = UIColor.green
        }
        else{
            imgIcon.image = cellData.icon
            lblDescreption.textColor = UIColor.black
        }*/
    }
    func Setup(data:sideMenuItem) {
        cellData = data
        imgIcon.image = data.icon
        lblDescreption.text = data.label
    }
    
}
