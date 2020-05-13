//
//  APICall.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import Foundation

class APICall {
    
    let apiKey = "2357aeac571b4e318c00d027ce77524f"
    
    func loadData(search: String, completion: @escaping (NewsFeed) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(search)&sortBy=relevancy&language=en&apiKey=\(apiKey)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            DispatchQueue.main.async {
                if let newsFeed = try? JSONDecoder().decode(NewsFeed.self, from: data) {
                    completion(newsFeed)
                } else {
                    print(error ?? "\(String(describing: error?.localizedDescription))")
                }
            }
        }.resume()
        
    }
    
}
