//
//  Request.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams { get }
    var headers: [String: Any]? { get }
    var dataType: DataType { get }
}

public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
}

public enum RequestParams {
    case none
    case url(_ : [String: Any]?)
}

public enum DataType {
    case json
}

public enum HeaderKeys: String {
    case contentType = "Content-Type"
    case acceptLanguage = "Accept-Language"
}
