//
//  ViewController.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/20/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    private let HOME_API:String = "https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios#";
    private var homeDataModel:HomeDataModel = HomeDataModel();
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
        FetchDataFromAPI.getJsonArrayFromApi(fromUrl: HOME_API) {[weak self] (homeData:HomeDataModel) in
            print(homeData);
            self?.homeDataModel = homeData;
            self?.dispatchGroup.leave();
        }
    }
    
    public func loadTableView() {
        
    }
}
