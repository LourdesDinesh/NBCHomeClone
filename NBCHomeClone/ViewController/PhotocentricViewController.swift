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
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

}

extension PhotocentricViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for:    indexPath) as! photocentricTableviewCell
        cell.tableviewCellHeight.constant = view.frame.height/1.6
        return cell
        
    }
    
    
}
