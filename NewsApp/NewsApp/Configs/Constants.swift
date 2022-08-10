//
//  Constants.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//
import UIKit

struct Constants {
    // swiftlint:disable type_name
   struct UI {
        static let screenBounds: CGRect = UIScreen.main.bounds
        static let screenSize: CGSize = CGSize(width: screenBounds.width, height: screenBounds.height)
    }
    
    struct Network {
        static let baseUrl = "https://newsapi.org/v2"
        static let apiKey = "43b6059835df476bb20540fad72b99fe"
    }
}
