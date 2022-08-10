//
//  DateExtension.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//
import Foundation

extension Date {
    func isInThisYear() -> Bool {
        return Calendar.current.component(Calendar.Component.year, from: self)
        == Calendar.current.component(Calendar.Component.year, from: Date())
    }
    
    func relativeTime() -> String {
        let currentDateSecs = Date().timeIntervalSince1970
        let articleDateSecs = self.timeIntervalSince1970
        let difference = Int(currentDateSecs - articleDateSecs)
        let hours = Int(difference / 3600)
        let minutes = (difference - (hours * 3600)) / 60
        let dateFormatter = DateFormatter.init()
        if self.isInThisYear() {
            dateFormatter.dateFormat = "dd MMMM"
        } else {
            dateFormatter.dateFormat = "dd MMM YYYY"
        }
        dateFormatter.locale = Locale.current
        let relativeTimeValue = dateFormatter.string(from: self)
        if hours <= 0 {
            if minutes > 2 {
                return "\(minutes) \("minutesAgo".localized())"
            }
            return "now".localized()
        } else if hours < 24 {
            if hours == 1 {
                return "hourAgo".localized()
            } else {
                return "\(hours) \("hourAgo".localized())"
            }
        } else if hours < 48 {
            return "yesterday".localized()
        } else if hours < 168 {
            let dayCount = Int(hours / 24)
            return "\(dayCount) \("daysAgo".localized())"
        }
        return relativeTimeValue
    }
}
