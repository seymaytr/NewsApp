//
//  ShareSheet.swift
//  NewsApp
//
//  Created by Seyma Yeter on 7.08.2022.
//

import Foundation
import UIKit
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
    
    var items: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
}
