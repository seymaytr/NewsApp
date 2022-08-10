//
//  NewsScreenViewModel.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation
import SwiftUI

class NewsScreenViewModel: BaseViewModel {
    @Published var articles: [Article] = []
    
    var totalResults = 0
    var page = 1
    var searchText = ""

    // MARK: - PAGINATION
    func loadMoreContent(_ item: Article) {
        if articles.last == item && articles.count < totalResults {
            page += 1
            getArticle(text: self.searchText, loadMore: true)
        }
    }
    
    func getArticle(text: String, loadMore: Bool? = false) {
        let loadMore = loadMore ?? false
        if !loadMore {
            page = 1
            totalResults = 0
            articles.removeAll()
        }
        self.searchText = text
        
        Task {
            let response = try? await NetworkManager.shared.execute(request: NewsRequest.getNews(text: text,
                                                                                                 page: String(page),
                                                                                                 apiKey: Constants.Network.apiKey),
                                                                    decodingType: NewsListResponse.self)
            if case .json(let data) = response, let list = data as? NewsListResponse {
                DispatchQueue.main.async {
                    self.totalResults = list.totalResults ?? 0
                    self.articles.append(contentsOf: list.articles ?? [])
                }
            }
            if case .error(let code, let error) = response {
                print("Request failed \(String(describing: code)) \(String(describing: error))")
            }
        }
    }
}
