//
//  UICollectionViewAdapter.swift
//  Teby
//
//  Created by Mohamed Hashem on 7/16/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import UIKit


class TableViewAdapter:UITableView,UITableViewDelegate,UITableViewDataSource
{
    var dataArray : Array<Any>!
    
    var cellHeight:CGFloat = 50
    
    private var reuseIdentifier = "Cell"
    
    var AutolayoutHeightConstraint:NSLayoutConstraint?
    
    var CellConfigurator : ((UITableViewCell,_ index:IndexPath)->())?
    
    var emptyDataLabel:UILabel=UILabel()
    
    /// cell xib name should match theclass name
    func setup(cell:String,data:Array<Any>,cell_Height:CGFloat,AL_Height:NSLayoutConstraint?,cellConfig:((UITableViewCell,_ index:IndexPath)->())?)
    {
       
        dataArray = data
        cellHeight = cell_Height
        AutolayoutHeightConstraint = AL_Height
        CellConfigurator = cellConfig
        reuseIdentifier = cell;
        self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
         return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
        CellConfigurator?(cell,indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sideMenu.handleMenuSelection(row: indexPath.row)
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
                        AutolayoutHeightConstraint.constant = self.contentSize.height
                        topView?.layoutIfNeeded()
                })
            }
            else
            {
                AutolayoutHeightConstraint.constant = self.contentSize.height
            }
            
        }
    }
    
    
    
}
