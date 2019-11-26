//
//  Constants.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/25/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
struct  Constants {
    struct ArticleTypes {
        public static let VIDEO:String = "Video";
        public static let ARTICLE:String = "Article";
        public static let VIDEO_RELEASE:String = "Video Release"
    }
    
    enum Templates:String {
        case HEADLINE_CENTRIC = "Headline Centric"
        case PHOTO_CENTRIC = "Photo Centric"
    }
}
