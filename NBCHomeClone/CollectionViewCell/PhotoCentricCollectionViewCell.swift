//
//  PhotoCentricCollectionViewCell.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 23/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PhotoCentricCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photocentricArticleTitle: UILabel!
    @IBOutlet weak var photocentricUpdateStatus: UILabel!
    @IBOutlet weak var photocentricheadimageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var photocentricTitleHeight: NSLayoutConstraint!
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    @IBOutlet weak var photoCentricCellTitlename: UILabel!
    @IBOutlet weak var PhotocentricHeadImage: UIImageView!
    
    @IBOutlet weak var photocentricArticletype: UIImageView!
    
    var photoCentricHeight : CGFloat = 0.0 {
        didSet {
            updateCellHeight()
        }
    }
    
    
    func updateCellHeight() {
        photocentricTitleHeight.constant = photoCentricHeight;
    }
    public func setValue(value:Items) {
          setArticleTitle(title: value.title)
          setHeadlineImage(imageUrl: value.thumbnailImageURL)
          setUpdatedTime(value.shortTimestamp)
      }
      
         private func setUpdatedTime(_ time:String) {
             photocentricUpdateStatus.text = time;
         }
         
         private func setArticleTitle(title:String) {
             photocentricArticleTitle.text = title;
         }
         
         private func setHeadlineImage(imageUrl:String) {
             PhotocentricHeadImage.loadImageFromURLString(imageUrl);
         }
}
