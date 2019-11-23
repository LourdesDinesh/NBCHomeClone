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
    private let HOME_API:String = "https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios#";
    private var homeDataModel:HomeDataModel?
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
            self?.homeDataModel = homeData;
            self?.dispatchGroup.leave();
        }
    }
    
    public func loadTableView() {
        print("Reload Called")
        newsTableView.reloadData();
    }
}

//ListCell Population
//extension HomeScreenViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1;
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let toReturn = homeDataModel?.modules[0].items.count ?? 0
//        print(toReturn)
//        return toReturn
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("Getting Cell")
//        let cell = newsTableView.dequeueReusableCell(withIdentifier: "listViewNewsCell") as! ListTableViewCell
//        cell.setValue(value: (homeDataModel?.modules[0].items[indexPath.row])!)
//        return cell;
//    }
//}
