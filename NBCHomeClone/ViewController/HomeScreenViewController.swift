//
//  ViewController.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/20/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    let leadImageSectionIdentifier = "LeadImage"
    
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

extension HomeScreenViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    let cell = tableView.dequeueReusableCell(withIdentifier: leadImageSectionIdentifier) as! LeadImageTableViewCell
        setGradientBackground(view:cell.gradientLayer)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    
}
