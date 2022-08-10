//
//  NewDetailScreenViewModel.swift
//  NewsApp
//
//  Created by Seyma Yeter on 7.08.2022.
//

import Foundation
import SwiftUI

enum NavigationBarAction: CaseIterable {
    case favorite
    case share

    var image: String {
        switch self {
        case .favorite:
            return "heart"
        case .share:
            return "square.and.arrow.up"
        }
    }
}

class NewDetailScreenViewModel: BaseViewModel {
    let article: Article

    var sharedItems: [Any] {
        return [URL(string: article.url ?? "") as Any]
    }

    var date: String {
        return Utility().getDate(dateString: article.publishedAt ?? "")
    }
    
    init(article: Article) {
        self.article = article
    }

    func goToNewsDetail() -> some View {
        WebView(urlString: article.url ?? "")
    }
    
    func addToFavoriteList() {
            let articleModel = ArticleDataModel(context: CoreDataManager.shared.viewContext)
            articleModel.title = article.title
            articleModel.subTitle = article.subTitle
            articleModel.urlToImage = article.urlToImage
            articleModel.publishedAt = article.publishedAt
            articleModel.url = article.url
            articleModel.author = article.author
            articleModel.content = article.content
            
            CoreDataManager.shared.save()
    }
}
