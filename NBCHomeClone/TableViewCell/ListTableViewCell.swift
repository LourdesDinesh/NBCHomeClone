//
//  ListTableViewCell.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/22/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var thumaNailImageView: UIImageView!
    @IBOutlet weak var updatedTime: UILabel!
    @IBOutlet weak var articleHeadline: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func setValue(value:Items) {
        setArticleTitle(title: value.title)
        setHeadlineImage(imageUrl: value.thumbnailImageURL)
        setUpdatedTime(value.shortTimestamp)
    }
    
    private func setUpdatedTime(_ time:String) {
        updatedTime.text = time;
    }
    
    private func setArticleTitle(title:String) {
        articleHeadline.text = title;
    }
    
    private func setHeadlineImage(imageUrl:String) {
        thumaNailImageView.loadImageFromURLString(imageUrl);
    }

}
