//
//  ImageViewExtension.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/23/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageFromURLString(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        image = nil
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if(error != nil) {
                print("Error ", error!)
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(data: data!)
            }

        }.resume()
    }
}
