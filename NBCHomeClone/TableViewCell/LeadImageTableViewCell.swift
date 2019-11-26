//
//  LeadImageTableViewCell.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 22/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class LeadImageTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPlayButton: UIImageView!
    @IBOutlet weak var updatedTimeStamp: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var gradientLayer: UIView!
    @IBOutlet weak var leadImage: UIImageView!
    
    public static let REUSABLE_IDENTIFIER:String = "LeadImageTableViewCell";
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setValue(value:Items) {
        setImage(withUrl: value.thumbnailImageURL)
        setUpdatedTimestamp(value.shortTimestamp)
        setArticleTitle(value.title)
        setVideoPlayButton(leadMedia: value.leadMedia);
    }
    
    private func setImage(withUrl url:String) {
        thumbnailImage.loadImageFromURLString(url);
    }
    
    private func setUpdatedTimestamp(_ time:String) {
        updatedTimeStamp.text = time;
    }
    
    private func setArticleTitle(_ title:String) {
        articleTitle.text = title;
    }
    
    private func setVideoPlayButton(leadMedia:LeadMedia?) {
        guard let unwrappedLeadMedia = leadMedia else {
            videoPlayButton.isHidden = true;
            return
        }
        if(unwrappedLeadMedia.typeName != Constants.ArticleTypes.VIDEO_RELEASE) {
            videoPlayButton.isHidden = true;
            return;
        }
        videoPlayButton.isHidden = false;
    }
}
