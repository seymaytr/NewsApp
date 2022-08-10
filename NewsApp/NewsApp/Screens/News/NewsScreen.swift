//
//  NewsScreen.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI

struct NewsScreen: View {
    @ObservedObject var viewModel: NewsScreenViewModel
    var size =  Constants.UI.screenSize
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(size: .init(width: size.width, height: size.height/7)) { text in
                    viewModel.getArticle(text: text)
                }
                Spacer()
                ScrollView {
                    LazyVStack {
                        if let list = viewModel.articles {
                            ForEach(list, id: \.self) { article in
                                NavigationLink(destination: NewsDetailScreen(viewModel:
                                        .init(article: article)), label: {
                                    NewsItemView(title: article.title, description: article.subTitle,
                                                 date: article.publishedAt, image: article.urlToImage)
                                    .onAppear {
                                        viewModel.loadMoreContent(article)
                                    }
                                })
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct NewsScreenPreviews: PreviewProvider {
    static var previews: some View {
        NewsScreen(viewModel: .init())
    }
}
