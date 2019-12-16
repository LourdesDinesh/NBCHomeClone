//
//  photocentricLayout.swift
//  NBCHomeClone
//
//  Created by Tringapps on 28/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//
import UIKit
protocol photocentricLayoutDelegate {
    func collectionview(collectionview: UICollectionView,heightAtindexpath indexPath:IndexPath) -> CGFloat
}
class photocentricLayout : UICollectionViewLayout {
    var delegate : photocentricLayoutDelegate!
    var noOfcolums = 2
    var padding : CGFloat  = 12.0
    var cache = [UICollectionViewLayoutAttributes]()
    var contentheight : CGFloat = 0
    var width :CGFloat {
        get{
            return (collectionView?.bounds.width)!
        }
    }
    override var collectionViewContentSize: CGSize {
        CGSize(width: width, height: contentheight)
    }
    override func prepare() {
        
        if cache.isEmpty {
            
            let columnWidth:CGFloat = (width / CGFloat(noOfcolums)) - 2 * padding
            var xOff = [CGFloat]()
            for column in 0..<noOfcolums{
                xOff.append(CGFloat(column) * (columnWidth + padding) + padding)
            }
            var yOff = [CGFloat](repeating: 0, count: noOfcolums)
            var column = 0
            for item in 0..<collectionView!.numberOfItems(inSection: 0){
                let indexPath = IndexPath(row: item, section: 0)
                let height:CGFloat = delegate.collectionview(collectionview: collectionView!, heightAtindexpath: indexPath) - 2 * padding
                let frame = CGRect(x: (xOff[column].truncatingRemainder(dividingBy: 2)==0) ? xOff[column] : xOff[column]+5, y: yOff[column] + 10, width: columnWidth, height: height)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                attributes.frame = frame
                cache.append(attributes)
                contentheight = max(contentheight, frame.maxY)
                yOff[column] = yOff[column] + height + padding
                column = column >= (noOfcolums - 1) ? 0 : column+1
            }
        }
       
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache{
            if attributes.frame.intersects(rect){
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
