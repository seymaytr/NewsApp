//
//  String+Extension.swift
//  NewsApp
//
//  Created by Seyma Yeter on 9.08.2022.
//

import Foundation

extension String {
    func localized(with comment: String="") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}
