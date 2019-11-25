//
//  GradientLayer.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 22/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
func setGradientBackground(view:UIView) {
    let colorBottom =  UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
    let colorTop = UIColor(red: 192.0/255.0, green: 192.0/255.0, blue: 192.0/255.0, alpha: 0.0).cgColor

    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = view.bounds

    view.layer.insertSublayer(gradientLayer, at:0)
}
