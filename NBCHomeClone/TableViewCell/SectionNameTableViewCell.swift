//
//  SectionNameTableViewCell.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/25/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SectionNameTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionName: UILabel!
    static let REUSABLE_IDENTIFIER:String = "sectionNameTableViewCell";
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setValue(title:String) {
        setTitle(title)
    }
    
    private func setTitle(_ title:String) {
        sectionName.text = title
    }
}
