//
//  LeadImageTableViewCell.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 22/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class LeadImageTableViewCell: UITableViewCell {

    @IBOutlet weak var gradientLayer: UIView!
    @IBOutlet weak var leadImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }

}
