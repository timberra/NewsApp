//
//  NetworkManager.swift
//  NewsApp
//
//  Created by liga.griezne on 21/11/2023.
//

import Foundation

class NetworkManager {
    
    static let api = "https://newsapi.org/v2/everything?q=apple&from=2023-11-15&to=2023-11-17&sortBy=popularity&apiKey=2e5602da78744431b0eb10529346c913"
    
    static func fetchData(url: String, completion: @escaping (NewsItems) -> () ) {

        guard let url = URL(string: url) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true

        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in

            guard err == nil else {
                print("err:::::", err!)
                return
            }

            guard let data = data else { return }


            do {
                let jsonData = try JSONDecoder().decode(NewsItems.self, from: data)
                completion(jsonData)
            }catch{
                print("err:::::", error)
            }

        }.resume()

    }
    
}
