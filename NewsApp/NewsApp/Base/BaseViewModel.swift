//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation
import SwiftUI
class BaseViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var viewContext

    init() {

    }
}
