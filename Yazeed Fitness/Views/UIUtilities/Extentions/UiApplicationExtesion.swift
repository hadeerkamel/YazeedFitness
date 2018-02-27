//
//  UiApplicationExtesion.swift
//  Yazeed Fitness
//
//  Created by Ahmed on 18/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
