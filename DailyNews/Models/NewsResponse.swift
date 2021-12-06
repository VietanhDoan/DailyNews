//
//  NewsResponse.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import Foundation

struct NewsResponse : Codable {
    var status: String
    var totalResults: String
    var articles: [Article]
}

struct Article: Codable {
    var source: Source
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
}

struct Source: Codable {
    var id: String
    var name: String
}
