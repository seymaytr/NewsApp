//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation
import SwiftUI
import Firebase

class BaseViewModel: ObservableObject {

    init() {
    }

    func sendLogEvent(_ name: String,  _ parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
