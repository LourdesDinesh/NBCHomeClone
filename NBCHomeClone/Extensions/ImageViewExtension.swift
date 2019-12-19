
import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageFromURLString(_ urlString: String) {
        if let cachedImageToSet = imageCache.object(forKey: urlString as NSString) as? UIImage {
            DispatchQueue.main.async { [weak self] in
                self?.image = cachedImageToSet
            }
            return
        }
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
            let imageFromUrl:UIImage = UIImage(data: data!) ?? UIImage()
            imageCache.setObject(imageFromUrl, forKey: urlString as NSString)

            DispatchQueue.main.async { [weak self] in
                self?.image = imageFromUrl
            }

        }.resume()
    }
}
