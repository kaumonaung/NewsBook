//
//  ArticleDetailView.swift
//  NewsBook
//
//  Created by Kaumon Aung on 13.05.20.
//  Copyright © 2020 Kaumon Aung. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    @State private var showingAlert = false
    
    let article: Article
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                URLImageView()
                    .frame(minWidth: 0, maxHeight: .infinity)
                    .padding(.bottom)
                
                Text(article.title ?? "No Title")
                    .font(.custom("Montserrat-Bold.ttf", size: 24))
                
                Text(article.description ?? "No description")
                    .font(.custom("Montserrat-Medium.ttf", size: 16))
                    .foregroundColor(Color.gray)
                
                HStack {
                    Text("\(article.author ?? "Unknown Author") | \(article.formattedDate) | \(article.source?.name ?? "Unknown Publisher")")
                        .font(.custom("Montserrat-Italic.ttf", size: 12))
                        .foregroundColor(Color.gray)
                }
                
                Divider()
                    .padding(.vertical)
                
                Text(article.content ?? "No Content")
                    .font(.custom("Montserrat-Regular.ttf", size: 16))
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarItems(trailing: Button(action: {
                self.copyToClipboard()
                self.showingAlert = true
            }, label: {
                Image(systemName: "paperclip")
                    .foregroundColor(Color.black)
            }))
        }
            
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Copied!"), message: Text("The url was copied to your clipboard."), dismissButton: .default(Text("OK")))
        }
    }
    
    func copyToClipboard() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = article.url
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(source: nil, author: "Test Author", title: "Test Title", description: "Test Description", url: "Test URL", urlToImage: "Test Image URL", publishedAt: "2020-04-24T02:29:20Z" , content: "Test Content"))
    }
}
