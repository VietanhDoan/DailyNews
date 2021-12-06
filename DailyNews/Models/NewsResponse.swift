//
//  NewsResponse.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import Foundation

class NewsResponse {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    init(info: [String: Any]) {
        if let status = info["status"] as? String {
            self.status = status
        }

        if let totalResults = info["totalResults"] as? Int {
            self.totalResults = totalResults
        }
        
        var tempArticles : [Article] = []
        if let articles = info["articles"] as? [[String: Any]] {
            for info in articles {
                tempArticles.append(Article(info: info))
            }
            self.articles = tempArticles
        }
        
//        if let articles = info["articles"] as? [Article] {
//            self.articles = articles
//        }
    }
}

class Article {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    init(info: [String: Any]) {
        if let source = info["source"] as? [String: Any] {
            self.source = Source(info: source)
        }

        if let author = info["author"] as? String {
            self.author = author
        }
        
        if let title = info["title"] as? String {
            self.title = title
        }
        
        if let description = info["description"] as? String {
            self.description = description
        }

        if let url = info["url"] as? String {
            self.url = url
        }
        
        if let urlToImage = info["urlToImage"] as? String {
            self.urlToImage = urlToImage
        }
        
        if let publishedAt = info["publishedAt"] as? String {
            self.publishedAt = publishedAt
        }
        
        if let content = info["content"] as? String {
            self.content = content
        }
    }
}

class Source {
    var id: String?
    var name: String?
    
    init(info: [String: Any]) {
        if let id = info["id"] as? String {
            self.id = id
        }

        if let name = info["name"] as? String {
            self.name = name
        }
    }
}
