//
//  FavoritesScreenViewModel.swift
//  NewsApp
//
//  Created by Seyma Yeter on 7.08.2022.
//

import Foundation
import SwiftUI

class FavoritesScreenViewModel: BaseViewModel {
    func getNews(model: ArticleDataModel) -> Article {
        return Article(author: model.author, title: model.title, subTitle: model.subTitle,
                       url: model.url, urlToImage: model.urlToImage, publishedAt: model.publishedAt,
                       content: model.content, source: nil)
    }
    
    func getAllArticles() -> [ArticleDataModel] {
        CoreDataManager.shared.getAllTasks()
    }
}
