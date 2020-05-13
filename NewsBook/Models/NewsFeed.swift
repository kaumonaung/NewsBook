//
//  NewsFeed.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    let totalResults: Int
    let articles: [Article]?
}
