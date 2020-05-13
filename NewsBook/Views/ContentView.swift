//
//  ContentView.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var feed: NewsFeed = NewsFeed(totalResults: 0, articles: [])
    
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchTerm, onCommit: fetchData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(feed.articles ?? []) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        HStack {
                            URLImageView(urlString: article.urlToImage)
                                .frame(width: 100)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(article.title ?? "Unknown title")
                                    .font(.custom("Montserrat-Medium.ttf", size: 16))
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("\(article.author ?? "Unknown author") | \(article.source?.name ?? "Unknown name") | \(article.formattedDate)")
                                    .font(.custom("Montserrat-Italic.ttf", size: 12))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("NewsBook")
        }
    }
    
    func fetchData() {
        let trimmed = searchTerm.filter {!$0.isWhitespace && !$0.isNewline}
        
        APICall().loadData(search: trimmed) { (NewsFeed) in
            self.feed = NewsFeed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
