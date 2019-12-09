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
    private let leadCellHeight:CGFloat = 200;
    private let listCellHeight:CGFloat = 111;
    private let headLineCentricCellHeight:CGFloat = 70;
    private let CollectionViewTableViewCellHeight:CGFloat = 425;
    private var homeDataModel:HomeDataModel?
    let dispatchGroup:DispatchGroup = DispatchGroup();
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController loaded");
        setDataSourceAndDelegate();
        fetchData();
        dispatchGroup.notify(queue: .main, execute: { [weak self] in
            self?.loadTableView();
        })
    }
    
    private func setDataSourceAndDelegate() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
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
        let numberOfSections = homeDataModel?.modules?.count ?? 0
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section > 2 && homeDataModel?.modules?[section].template == Constants.Templates.PHOTO_CENTRIC.rawValue) {
            return 2
        }
        let numberOfRows = homeDataModel?.modules?[section].items.count ?? 0
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //LeadCell
        if(indexPath.row == 0) {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: LeadImageTableViewCell.REUSABLE_IDENTIFIER) as! LeadImageTableViewCell;
            cell.setValue(value: (homeDataModel?.modules?[indexPath.section].items[indexPath.row])!)
            return cell;
        }
        if(indexPath.section < 3) {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.REUSABLE_IDENTIFIER) as! ListTableViewCell
            cell.setValue(value: (homeDataModel?.modules?[indexPath.section].items[indexPath.row])!)
            return cell;
        } else {
            switch homeDataModel?.modules?[indexPath.section].template {
            case Constants.Templates.PHOTO_CENTRIC.rawValue:
                let cell = newsTableView.dequeueReusableCell(withIdentifier: photocentricTableviewCell.REUSABLE_IDENTIFIER) as! photocentricTableviewCell
                cell.setValue(value: ((homeDataModel?.modules?[indexPath.section].items)!))
                return cell;
            case Constants.Templates.HEADLINE_CENTRIC.rawValue:
                let cell = newsTableView.dequeueReusableCell(withIdentifier: HeadlineCentricTableViewCell.REUSABLE_IDENTITY) as! HeadlineCentricTableViewCell
                cell.setValue(value: (homeDataModel?.modules?[indexPath.section].items[indexPath.row])!)
                return cell;
            default:
                print("Unexpected Type. This  has to be loaded in WebView")
                return UITableViewCell()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return leadCellHeight
        } else if(indexPath.section < 3) {
            return listCellHeight
        } else {
            let cellTemplate:String = homeDataModel?.modules?[indexPath.section].template ?? "";
            switch cellTemplate {
            case Constants.Templates.HEADLINE_CENTRIC.rawValue:
                return headLineCentricCellHeight
            case Constants.Templates.PHOTO_CENTRIC.rawValue:
                //MARK:- Have to change this value
//                if(indexPath.row > 1) {
//                    return 0
//                }
            return CollectionViewTableViewCellHeight
//                let cell = newsTableView.dequeueReusableCell(withIdentifier: photocentricTableviewCell.REUSABLE_IDENTIFIER) as! photocentricTableviewCell
             
            default:
                return 0
            }
        }
    }
}

extension HomeScreenViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(homeDataModel?.modules?[section].items.count == 0) {
                   return nil
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionNameTableViewCell.REUSABLE_IDENTIFIER) as! SectionNameTableViewCell
        cell.setValue(title: (homeDataModel?.modules?[section].pageTitle) ?? "")
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(homeDataModel?.modules?[section].items.count == 0) {
                   return 0
        }
        return 33
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(homeDataModel?.modules?[section].items.count == 0) {
                   return 0
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if(homeDataModel?.modules?[section].items.count == 0) {
                   return nil
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SeeMoreTableViewCell.REUSABLE_IDENTIFIER);
        return cell;
    }
}
