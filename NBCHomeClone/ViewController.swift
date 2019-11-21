//
//  ViewController.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/20/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let HOME_API:String = "https://demo3978672.mockable.io/";
    let dispatchGroup:DispatchGroup = DispatchGroup();
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController loaded");
        fetchData();
        dispatchGroup.notify(queue: .main, execute: { [weak self] in
            self?.loadTableView();
        })
    }
    
    public func fetchData() {
        dispatchGroup.enter();
        FetchDataFromAPI.getJsonArrayFromApi(fromUrl: HOME_API) {[weak self] (home:Home) in
            print(home.msg!);
            self?.dispatchGroup.leave();
        }
    }
    
    public func loadTableView() {
        
    }
}

