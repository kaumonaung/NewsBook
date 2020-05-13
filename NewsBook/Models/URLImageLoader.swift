//
//  URLImageLoader.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import Foundation
import SwiftUI

class URLImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        guard let urlString = urlString else { return }
        
        guard let imageURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            DispatchQueue.main.async {
                if let loadedImage = UIImage(data: data) {
                    self.image = loadedImage
                } else {
                    print(error ?? "\(String(describing: error?.localizedDescription))")
                }
            }
        }.resume()
        
    }
}
