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
    var maxNumberOfLines:Int!
        var data : [String] = ["sdsfsdd","titfjg","jhfghfghfghfhfhfhdhdfhdhdhdddhdfhfh","titlfindfgfgfdsfgdd"]
        var lineData : [Int] = [0]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyLabel()
        lineData = findnoLine(datainfo: data)
        maxNumberOfLines = maxNumber(inArray: lineData)
        print(lineData)
//        var layout = photocentricLayout.self as UICollectionViewLayout
    }
    
    func setupDummyLabel() {
        dumlabel.frame.size.width = UIScreen.main.bounds.width/2
    }
    
        func findnoLine(datainfo : [String]) -> [Int]
        {
            var lineData1 = [Int]()
            let data1 = data
            for string1 in data1 {
                dumlabel.text = string1
                let count = dumlabel.maxNumberOfLines
                lineData1.append(count)
            }
            return lineData1
        }
    public func maxNumber(inArray array:[Int]) -> Int {
        var max = 0
        for number in array {
            if(number > max) {
                max = number
            }
        }
        return max
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
        cell.maxLine = maxNumberOfLines;
        return cell
    }
}




