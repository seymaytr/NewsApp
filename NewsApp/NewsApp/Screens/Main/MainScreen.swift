//
//  MainScreen.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel: MainScreenViewModel

    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        let tabbarAppearance = UITabBarAppearance()
        UITabBar.appearance().scrollEdgeAppearance = tabbarAppearance
    }

    var body: some View {
        TabView {
            NewsScreen(viewModel: .init())
                .tabItem {
                    HStack {
                        Image(systemName: "newspaper")
                        Text("news".localized())
                    }
                }
            
            FavoritesScreen(viewModel: .init())
                .tabItem {
                    HStack {
                        Image(systemName: "heart")
                        Text("favorites".localized())
                    }
                }
        }
        .accentColor(.red)
    }
}

struct MainScreenPreviews: PreviewProvider {
    static var previews: some View {
        MainScreen(viewModel: .init())
    }
}
