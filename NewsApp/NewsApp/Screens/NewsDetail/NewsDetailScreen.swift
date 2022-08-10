//
//  NewsDetailScreen.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation
import SwiftUI

struct NewsDetailScreen: View {
    @ObservedObject var viewModel: NewDetailScreenViewModel
    @State var isShare = false
    var size =  Constants.UI.screenSize
    
    var body: some View {
        let article = viewModel.article
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray.opacity(0.5)
                    }
                    .frame(width: size.width, height: size.height/3.5)
                    
                    Spacer()

                    if let title = article.title {
                        Text(title)
                            .padding()
                            .font(.body.bold())
                    }
                    
                    HStack {
                        if let date = viewModel.date {
                            Image(systemName: "calendar")
                            Text(date)
                                .padding(.trailing)
                        }
                        
                        if let author = article.author {
                            Image(systemName: "pencil.and.outline")
                            Text(author)
                        }
                    }
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))

                    if let content = article.content {
                        Text(content)
                            .padding()
                    }
                }
            }
            
            VStack {
                Spacer()
                NavigationLink(destination: viewModel.goToNewsDetail(), label: {
                    Text("newsDetail".localized())
                        .padding()
                        .border(.black, width: 2)
                })
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                ForEach(NavigationBarAction.allCases, id: \.self) { action in
                    Button {
                        switch action {
                        case .favorite:
                            viewModel.addToFavoriteList()
                        case .share:
                            isShare = true
                        }
                    } label: {
                        Image(systemName: action.image)
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $isShare, content: {
            ShareSheet(items: viewModel.sharedItems)
        })
    }
}

// struct NewsDetailScreenPreviews: PreviewProvider {
//    static var previews: some View {
//        NewsDetailScreen()
//    }
// }
