//
//  DetailedViewController.swift
//  NBCHomeClone
//
//  Created by Ponkumar's Mac on 18/12/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var data = Items()
    @IBOutlet weak var detailContent: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(value:data)
    }
    
 func setValue(value:Items) {
    detailContent.text = value.title
    detailImage.loadImageFromURLString(value.thumbnailImageURL!);
    }
}
