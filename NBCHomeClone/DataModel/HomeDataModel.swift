//
//  Home.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/21/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
struct HomeDataModel:Decodable {
    var modules:[Modules]!;
}

struct Modules:Decodable {
    var template:String!;
    var pageTitle:String!;
    var typeName:String!;
    var listSize:Int!;
    var type:String!;
    var location:String!;
    var items:[Items];
}

struct Items:Decodable {
    var typeName:String!;
    var title:String!;
    var thumbnailImageURL:String!;
    var shortTimestamp:String!;
    var sponsored:Bool;
}
