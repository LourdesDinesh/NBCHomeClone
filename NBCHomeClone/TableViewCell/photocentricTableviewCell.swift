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
    var cellHeightConstant : CGFloat = 0.0
    var maxLine : Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.photocentricCollectioview.dataSource = self
        self.photocentricCollectioview.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBOutlet weak var tableviewCellHeight: NSLayoutConstraint!
    

    
}

extension photocentricTableviewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionviewCellWidth : CGFloat  = (self.frame.size.width/2) - 20
        let collectionviewCellHeight : CGFloat  = (self.frame.height/2)
        return CGSize(width: collectionviewCellWidth, height: collectionviewCellHeight)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func checkMaxLine(count:Int) -> Int
    {
        if (count > maxLine)
        {
            maxLine = count
        }
        return maxLine
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCentric" , for:    indexPath) as! PhotoCentricCollectionViewCell
            cell.photoCentricCellTitlename.text = "sdssdd ."
            cell.cellWidth.constant = cell.frame.size.width
            cell.photocentricheadimageHeight.constant = cell.frame.size.height / 2
            cellHeightConstant = cell.photoCentricCellTitlename.frame.size.height
            let lines = cell.photoCentricCellTitlename.maxNumberOfLines
            maxLine = checkMaxLine(count: lines)
            cell.photocentricTitleHeight.constant = cellHeightConstant * CGFloat(maxLine)

            return cell;
        }else if indexPath.row == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCentric" , for:    indexPath) as! PhotoCentricCollectionViewCell
            cell.photoCentricCellTitlename.text = "titfgsddgfgdfgdfgdfgdgdghgjhjghjjgfjfhjfjfjfgjfgdffddgdgghe ."
            cell.cellWidth.constant = cell.frame.size.width
            cell.photocentricheadimageHeight.constant = cell.frame.size.height / 2
            cellHeightConstant = cell.photoCentricCellTitlename.frame.size.height
            let lines = cell.photoCentricCellTitlename.maxNumberOfLines
            maxLine = checkMaxLine(count: lines)
            cell.photocentricTitleHeight.constant = cellHeightConstant * CGFloat(maxLine)
     
            return cell;
        }
        else {
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCentric" , for:    indexPath) as! PhotoCentricCollectionViewCell
          cell.photoCentricCellTitlename.text = "titlfindfgfgfdsfgdd"
            cell.cellWidth.constant = cell.frame.size.width
            cell.photocentricheadimageHeight.constant = cell.frame.size.height / 2
            cellHeightConstant = cell.photoCentricCellTitlename.frame.size.height
            let lines = cell.photoCentricCellTitlename.maxNumberOfLines
            maxLine = checkMaxLine(count: lines)
          cell.photocentricTitleHeight.constant = cellHeightConstant * CGFloat(maxLine)
            
            return cell;
        }
        
    }
    
}
extension UILabel {
     var maxNumberOfLines: Int {
         let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
         let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font as Any], context: nil).height
         let lineHeight = font.lineHeight
        if (Int(ceil(textHeight / lineHeight))) > 3 {
           return 3
        }
        else{
            return Int(ceil(textHeight / lineHeight))
        }
     }
 }

