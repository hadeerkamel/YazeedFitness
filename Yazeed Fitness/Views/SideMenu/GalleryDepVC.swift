//
//  GalleryDepVC.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 31/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import UIKit

class GalleryDepVC: UIViewController {

    //MARK: - Outlets -
    @IBOutlet weak var depCollectionView: UICollectionView!
    
    //MARK: - properties -
    var depImages : DepImages! = nil
    var depVideos : DepVideos! = nil
    var photoView : Bool!
    var scrollindex : IndexPath!
    
    //MARK: - cntroller life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.depCollectionView.register(UINib(nibName: "DepDetailsCell", bundle: nil), forCellWithReuseIdentifier: "DepDetailsCell")
        
        
    }
    override func viewDidLayoutSubviews() {
        depCollectionView.scrollToItem(at:IndexPath(item: scrollindex.row, section: 0), at: .right, animated: false)
    }

}
extension GalleryDepVC :UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photoView && depImages != nil {
            return depImages.array.count 
        }else if !photoView && depVideos != nil {
            return depVideos.array.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width )
        let height = (collectionView.frame.height )
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepDetailsCell", for: indexPath) as! DepDetailsCell
        if photoView && depImages != nil {
            cell.setup(imageURL:  NetworkConstants.baseImageURL + depImages.array[indexPath.row].image)
            
        }else if !photoView && depVideos != nil {
            cell.setup(imageURL: depVideos.array[indexPath.row].thumbnail)
            
        }
      
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if !photoView  {
            let url = NSURL(string: depVideos.array[indexPath.row].url)! as URL
             if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
            
        }
    }
}
