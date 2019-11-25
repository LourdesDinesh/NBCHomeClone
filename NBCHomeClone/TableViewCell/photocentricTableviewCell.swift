//
//  photocentricTableviewCellTableViewCell.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 23/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class photocentricTableviewCell: UITableViewCell {
    @IBOutlet weak var photocentricCollectioview: UICollectionView!
      private var homeDataModel:HomeDataModel?
    override func awakeFromNib() {
        super.awakeFromNib()
       self.photocentricCollectioview.delegate = self
        self.photocentricCollectioview.dataSource = self
        self.photocentricCollectioview.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension photocentricTableviewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionviewCellWidth : CGFloat  = (self.frame.size.width/2) - 20
        let collectionviewCellHeight : CGFloat  = (self.frame.height/2) - 20
        return CGSize(width: collectionviewCellWidth, height: collectionviewCellHeight)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  10
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return  2
//    }
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCentric" , for:    indexPath) as! PhotoCentricCollectionViewCell
//       cell.photoCentricCellTitlename.text = "asdfgvfdgfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgasdfgvfdgfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgfdfgdfgf"
        cell.cellWidth.constant = cell.frame.size.width
        cell.photoCentricCellTitlename.preferredMaxLayoutWidth = cell.frame.size.width
        
            return cell;
                    
    }
    
    
}
