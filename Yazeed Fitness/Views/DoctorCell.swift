//
//  DoctorCell.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 24/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {

    //MARK: - Outlets -
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorSpecialtyLabel: UILabel!
    //MARK: - Properties -
    var doctorData : Doctor!
    
    //MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - Setup -
    func Setup (data:Doctor){
        doctorData = data
        
        if let url = URL(string:  NetworkConstants.baseImageURL + doctorData.photo)
        {
            styles.BorderRad(targets: doctorImage, Radus: doctorImage.frame.width / 2, borderWidth: 0, BorderColor: UIColor.white)
            doctorImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_doctor"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        doctorNameLabel.text = doctorData.name
        doctorSpecialtyLabel.text = doctorData.specialty

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Butons Actoins -
    @IBAction func didTpaWhatsAppButton(_ sender: Any) {
       // doctorData.mobile = "+201274554230"
        let helloMessage = "Hello from Yazeed Fitness application"
        let urlWhats = "whatsapp://send?phone=\(doctorData.mobile)&abid=12354&text=\(helloMessage)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.openURL(whatsappURL)
                } else {
                    print("Install Whatsapp")
                    
                }
            }
        }    }
   
    
}
