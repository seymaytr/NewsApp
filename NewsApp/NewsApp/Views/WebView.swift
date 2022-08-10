//
//  Webview.swift
//  NewsApp
//
//  Created by Seyma Yeter on 7.08.2022.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            uiView.load(URLRequest(url: url))
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://www.apple.com")
    }
}
