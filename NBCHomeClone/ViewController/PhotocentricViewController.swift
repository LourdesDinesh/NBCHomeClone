//
//  PhotocentricViewController.swift
//  NBCHomeClone
//
//  Created by Ponkumaran on 23/11/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PhotocentricViewController: UIViewController {
    @IBOutlet weak var sampletableview: UITableView!
    var dumlabel : UILabel = UILabel()
        var data : [String]? = ["title oe...title of the arcvcxvxvxvxvticle was shown here...","title of the article was shown here...","title of the artf the article was shown here...title of the article was shown here...title of the article was shown hercle was shown herecvxvcxxvxv...","title of the article was shown here..."]
        var lineData : [Int] = [0]
    override func viewDidLoad() {
        super.viewDidLoad()
//        lineData = findnoLine(datainfo: self.data!)
//        print(lineData)
        var layout = UICollectionViewLayout as photocentricLayout
        
    }
        func findnoLine(datainfo : [String]) -> [Int]
        {
            var lineData1 = [Int]()
            let data1 = data
            for string1 in data1! {
                dumlabel.text = string1
                let count = dumlabel.maxNumberOfLines
                lineData1.append(count)
            }
            return lineData1
            
        }
}

extension PhotocentricViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height/1.7
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for:    indexPath) as! photocentricTableviewCell
  //  cell.tableviewCellHeight.constant = view.frame.height/1.7
        return cell
        
    }
    
    
}

extension photocentricTableviewCell : photocentricLayoutDelegate{
    func collectionview(collectionview: UICollectionView, heightAtindexpath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

}
