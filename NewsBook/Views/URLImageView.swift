//
//  URLImageView.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject var urlImageModel: URLImageLoader
    
    init(urlString: String?) {
        urlImageModel = URLImageLoader(urlString: urlString)
    }
    
    static var defaultImage = UIImage(named: "placeholder")
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
            .resizable()
            .scaledToFit()
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: "https://unsplash.com/photos/T7K4aEPoGGk")
    }
}
