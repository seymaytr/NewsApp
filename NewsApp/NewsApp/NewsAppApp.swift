//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI

@main
struct NewsAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainScreen(viewModel: .init())
        }
    }
}
