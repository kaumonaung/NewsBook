//
//  Article.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source?
    
    let author: String?
    let title: String?
    let description: String?
    
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        let date = formatter.date(from: publishedAt ?? "")
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date ?? Date())
    }
    
}

struct Source: Codable {
    let id: String?
    let name: String?
}
