//
//  Utility.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation

class Utility {
    func getDate(dateString: String) -> String {
        let date = dateString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.date(from: date)
        let dateTimeStamp  = dateString?.relativeTime()
        return dateTimeStamp ?? ""
    }
}
