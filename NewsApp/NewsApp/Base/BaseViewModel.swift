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
    @Environment(\.managedObjectContext) private var viewContext

    init() {

    }

    func sendLogEvent(name: String,  parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
