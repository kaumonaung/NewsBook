//
//  ContentView.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    
    let testData = NewsFeed(totalResults: 10, articles: [Article(source: Source(id: nil, name: "Test Name"), author: "Test Author", title: "Test Title", description: "Test description", url: "Test URL", urlToImage: "Test URL Image", publishedAt: "2020-05-12T13:00:46Z", content: "Test Content"), Article(source: nil, author: "Test Author", title: "Test Title", description: "Test description", url: "Test URL", urlToImage: "Test URL Image", publishedAt: "2020-05-12T13:00:46Z", content: "Test Content")])
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchTerm, onCommit: fetchData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                List(testData.articles ?? []) { article in
                    HStack {
                        URLImageView()
                            .frame(width: 100)
                        VStack(alignment: .leading) {
                            Text(article.title ?? "Unknown title")
                                .font(.headline)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("\(article.author ?? "Unknown author") | \(article.source?.name ?? "Unknown name") | \(article.formattedDate)")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("NewsBook")
        }
    }
    
    func fetchData() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
