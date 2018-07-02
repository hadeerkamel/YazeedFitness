//
//  DepCell.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 28/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit
import Kingfisher
class DepCell: UITableViewCell {
    //MARK: - Outlets -
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var depImage: UIImageView!
    @IBOutlet weak var depTitleLable: UILabel!
    @IBOutlet weak var depDescriptionLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    
    //MARK: - properties -
    var depData:Department! = nil
    
    //MARK: - Cell life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        cellStyle()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Style -
    func cellStyle(){
        //cellView.borderRad(Radus: 2, borderWidth: 0)
        self.selectionStyle = .none
        styles.BorderRad(targets: arrowImage, Radus:arrowImage.frame.width / 2, borderWidth: 0, BorderColor: UIColor.white)
        
        
    }
    func Setup(Data:Department){
        depData = Data
        populateCell ()
    }
    func populateCell(){
        if let url = URL(string:  NetworkConstants.baseImageURL + depData.icon)
        {
            styles.BorderRad(targets: depImage, Radus:depImage.frame.width / 2, borderWidth: 0, BorderColor: UIColor.white)
            depImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_ohter_department"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        depTitleLable.text = depData.title
        depDescriptionLabel.text = depData.shortDescription
    }
    
}
