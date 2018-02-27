//
//  DepDetailsVC.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 29/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit
import MBProgressHUD

class DepDetailsVC: UIViewController {

    //MARK: - Outlets -
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    @IBOutlet weak var videosView: UIView!
    @IBOutlet weak var videosLabel: UILabel!
    
    @IBOutlet weak var photosView: UIView!
    @IBOutlet weak var photosLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: - Properties
    
    var depData: Department! = nil
    var depImages: DepImages! = nil
    var depVideos: DepVideos! = nil
    var photoView = false
    
    //MARK: - Controller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        populateScreen()
        initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    //MARK: - Buttons Actions -
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Helpers -
    func populateScreen(){
        if let url = URL(string:  NetworkConstants.baseImageURL + depData.coverImage)
        {
            coverPhoto.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_ohter_department"), options: nil, progressBlock: nil, completionHandler: nil)
            coverPhoto.alpha = 0.7
        }

        titleLabel.text = depData.title
        descLabel.text = depData.description
        
    }
    func initialization(){
        self.collectionView.register(UINib(nibName: "DepDetailsCell", bundle: nil), forCellWithReuseIdentifier: "DepDetailsCell")
        photosView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.photoViewSelection)))
        videosView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.videoViewSelection)))
      
        photoViewSelection()
    }
    func photoViewSelection(){
        if !photoView{
            select(view: photosView, label: photosLabel)
            disselect(view: videosView, label: videosLabel)
            photoView = true
            self.collectionView.reloadData()
            
            PrDepsDetails.getDepImages(depID: depData.id) { (success, message, Images) in
                if success {
                    self.depImages = Images
                    self.collectionView.reloadData()
                }else{
                    showMessageBanner(title: message,error: true)
                }
            }
        }
    }
    func videoViewSelection(){
        if photoView{
            
            select(view: videosView, label: videosLabel)
            disselect(view: photosView, label: photosLabel)
            photoView = false
            self.collectionView.reloadData()

            PrDepsDetails.getDepVideos(depID: depData.id) { (success, message, Videos) in
                if success {
                    self.depVideos = Videos
                    self.collectionView.reloadData()
                }else{
                    showMessageBanner(title: message,error: true)
                }
            }
        }
    }
    func select(view: UIView,label: UILabel){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.alpha = 1
    }
    func disselect(view: UIView,label: UILabel){
        view.backgroundColor = UIConstants.Colors.heavyBlue
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.alpha = 0.7
    }
}
extension DepDetailsVC : UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photoView && depImages != nil {
            return depImages.array.count
        }else if !photoView && depVideos != nil {
            return depVideos.array.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = (collectionView.frame.width - 20 )/3
         return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepDetailsCell", for: indexPath) as! DepDetailsCell
        if photoView && depImages != nil {
           cell.setup(imageURL: NetworkConstants.baseImageURL + depImages.array[indexPath.row].image)
            
        }else if !photoView && depVideos != nil {
           cell.setup(imageURL: depVideos.array[indexPath.row].thumbnail)
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //open gallery
        let VC = self.storyboard?.instantiateViewController(withIdentifier: UIConstants.Screens.DepGallery) as! GalleryDepVC
        VC.photoView = photoView
        VC.scrollindex = indexPath
        if photoView {
            VC.depImages = depImages
        }else if !photoView  {
           VC.depVideos = depVideos
            
        }
    
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
