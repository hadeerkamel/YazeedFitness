//
//  CollectionViewAdapter.swift
//  Teby
//
//  Created by Mohamed Hashem on 7/16/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import UIKit


class CollectionViewAdapter: UICollectionView , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var dataArray : Array<Any>!
    var cellSize : CGSize!
    
    private var reuseIdentifier = "Cell"
    
    var AutolayoutHeightConstraint:NSLayoutConstraint?
    
    var CellConfigurator : ((UICollectionViewCell,_ index:IndexPath)->())?
    
    var didSelectItemAt: ((_ index:IndexPath,_ cell:UICollectionViewCell)->())?
    var didDeSelectItemAt: ((_ index:IndexPath,_ cell:UICollectionViewCell)->())?

    var emptyDataLabel:UILabel=UILabel()
    
    
    /// cell xib name should match theclass name
    func setup(cell:String,data:Array<Any>,cellsize:CGSize,AL_Height:NSLayoutConstraint?,cellConfig:((UICollectionViewCell,_ index:IndexPath)->())?)
    {
        dataArray = data
        cellSize = cellsize
        AutolayoutHeightConstraint = AL_Height
        CellConfigurator = cellConfig
        reuseIdentifier = cell;
        self.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        
        self.delegate = self
        self.dataSource = self
    }
    
    /// emptyData---
    func SetEmptyDataLabel(label:String)
    {
        emptyDataLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        emptyDataLabel.text = label
        addSubview(emptyDataLabel)
        emptyDataLabel.center = center
        emptyDataLabel.sizeToFit()
    }
    override func reloadData()
    {
        super.reloadData()
        emptyDataLabel.isHidden = dataArray.count != 0
        Stretch(Animated: false)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        emptyDataLabel.center = CGPoint(x: center.x, y: frame.size.height/2)
        
    }
    ///---
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        CellConfigurator?(cell,indexPath)
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return cellSize
    }
    func AddItem(item:Any,Animated:Bool)
    {
        dataArray.append(item)
        self.reloadData()
        Stretch(Animated: Animated)
    }
    func removeItem(at index: IndexPath,Animated:Bool)
    {
        dataArray.remove(at: index.row)
        self.reloadData()
        Stretch(Animated: Animated)
    }
    func Stretch(Animated:Bool)
    {
        if let AutolayoutHeightConstraint = AutolayoutHeightConstraint
        {
            let topView = UIApplication.topViewController()?.view
            if Animated && topView != nil
            {
                UIView.animate(withDuration:0.5, animations:
                    {
                        AutolayoutHeightConstraint.constant = self.collectionViewLayout.collectionViewContentSize.height
                        topView?.layoutIfNeeded()
                })
            }
            else
            {
                AutolayoutHeightConstraint.constant = self.collectionViewLayout.collectionViewContentSize.height
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        didSelectItemAt?(indexPath,cell!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        didDeSelectItemAt?(indexPath,cell!)
    }
    
    
}



