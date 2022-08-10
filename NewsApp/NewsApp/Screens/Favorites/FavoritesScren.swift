//
//  FavoritesScren.swift
//  NewsApp
//
//  Created by Seyma Yeter on 7.08.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @ObservedObject var viewModel: FavoritesScreenViewModel
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVStack {
                    if let list = viewModel.getAllArticles() {
                        ForEach(list) { article in
                            NavigationLink(destination: NewsDetailScreen(viewModel:
                                    .init(article: viewModel.getNews(model: article))),
                                           label: {
                                NewsItemView(title: article.title, description: article.subTitle,
                                             date: article.publishedAt, image: article.urlToImage)
                            })
                        }
                    }
                }
            }
        }
    }
}
struct FavoritesScrenPreviews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen(viewModel: .init())
    }
}
