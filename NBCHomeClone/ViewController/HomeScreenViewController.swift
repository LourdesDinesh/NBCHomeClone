//
//  ViewController.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/20/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    let leadImageSectionIdentifier = "LeadImage"
    
    private let HOME_API:String = "https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios#";
    private var homeDataModel:HomeDataModel?
    let dispatchGroup:DispatchGroup = DispatchGroup();
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController loaded");
        setDataSource();
        fetchData();
        dispatchGroup.notify(queue: .main, execute: { [weak self] in
            self?.loadTableView();
        })
    }
    
    private func setDataSource() {
        newsTableView.dataSource = self
    }
    
    private func fetchData() {
        dispatchGroup.enter();
        FetchDataFromAPI.getJsonArrayFromApi(fromUrl: HOME_API) {[weak self] (homeData:HomeDataModel) in
            self?.homeDataModel = homeData;
            self?.dispatchGroup.leave();
        }
    }
    
    private func loadTableView() {
        print("Reload TableView Data")
        newsTableView.reloadData();
    }
}

//ListCell Population
extension HomeScreenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let toReturn = homeDataModel?.modules[0].items.count ?? 0
        return toReturn
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "listViewNewsCell") as! ListTableViewCell
        cell.setValue(value: (homeDataModel?.modules[0].items[indexPath.row])!)
        return cell;
    }
}
//extension HomeScreenViewController:UITableViewDelegate,UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let cell = tableView.dequeueReusableCell(withIdentifier: leadImageSectionIdentifier) as! LeadImageTableViewCell
//        setGradientBackground(view:cell.gradientLayer)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        150.0
//    }
//
//}
