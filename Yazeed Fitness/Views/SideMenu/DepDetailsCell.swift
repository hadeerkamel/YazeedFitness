//
//  DepDetailsCell.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit
import Kingfisher

class DepDetailsCell: UICollectionViewCell {
    
    //MARK: - Outlets -
    @IBOutlet weak var cellImage: UIImageView!
    
    //MARK: - life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    //MARK: - Helpers -
    func setup(imageURL:String){
        if let url = URL(string: imageURL)
        {
            styles.BorderRad(targets: cellImage, Radus: 3, borderWidth: 0, BorderColor: UIColor.white)
            cellImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_ohter_department"), options: nil, progressBlock: nil, completionHandler: nil)
        }

        
    }

}
