//
//  FetchDataFromAPI.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/21/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class FetchDataFromAPI {
    public class func getJsonArrayFromApi<T: Decodable>(fromUrl urlString:String, completion:@escaping (T)->Void) {
        print("Fetching Data From API: \(urlString)")
        let urlObject:URL? = URL(string: urlString)
        if(urlObject == nil) {print("This is a fking retard")}
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            do {
                guard let data = data else{return}
                let jsonArray = try JSONDecoder().decode(T.self, from: data)
                completion(jsonArray);
            } catch {
                print("Error in Fetching Data: \(error)")
            }
            print("Network Request Is Completed")
        }.resume()
    }
}
