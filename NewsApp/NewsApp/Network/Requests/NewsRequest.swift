//
//  NewsRequest.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation

public enum NewsRequest: Request {
    case getNews(text: String, page: String, apiKey: String)
    
    public var path: String {
        switch self {
        case .getNews:
            return "/everything"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    public var parameters: RequestParams {
        switch self {
        case .getNews(let text, let page, let apiKey):
            return .url(["q": text,
                         "page": page,
                         "apiKey": apiKey])
        }
    }
    
    public var headers: [String: Any]? {
        switch self {
        case .getNews:
            return nil
        }
    }
    
    public var dataType: DataType {
        switch self {
        case .getNews:
            return .json
        }
    }
}
