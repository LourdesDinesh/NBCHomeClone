//
//  HeadlineCentricTableViewCell.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/25/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HeadlineCentricTableViewCell: UITableViewCell {
    public static let REUSABLE_IDENTITY:String = "headlineCentricTableViewCell";
    @IBOutlet weak var articleTypeImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var updatedTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    public func setValue(value: Items) {
        setHeadline(withTitle: value.title)
        setArticleType(value.typeName)
        setUpdatedTime(value.shortTimestamp)
    }
    
    private func setHeadline(withTitle title:String) {
        articleTitle.text = title;
    }
    
    private func setArticleType(_ type:String!) {
        guard let articleType = type else {
            articleTypeImage.isHidden = true;
            return;
        }
        if(articleType == "Article") {
            return;
        }
        articleTypeImage.isHidden = false;
        let titleWithType:String = "    \(articleType)  |  \(articleTitle.text ?? "")"
        articleTitle.text = titleWithType;
    }
    
    private func setUpdatedTime(_ time:String) {
        updatedTime.text = time;
    }
}
