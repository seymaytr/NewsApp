//
//  NewsListResponse.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation

// MARK: NewsList Model
struct NewsListResponse: Codable {
 let status: String?
 let totalResults: Int?
 let articles: [Article]?
}

// MARK: Article Model
struct Article: Codable, Hashable {
  let author: String?
  let title: String?
  let subTitle: String?
  let url: String?
  let urlToImage: String?
  let publishedAt: String?
  let content: String?
  let source: Source?
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case subTitle = "description"
        case url
        case urlToImage
        case publishedAt
        case content
        case source
    }
}

// MARK: Source Model
struct Source: Codable, Hashable {
  let id: String?
  let name: String?
}
