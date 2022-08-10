//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case parseError
    case invalidData
}

public final class NetworkManager {
    public static let shared = NetworkManager()

    public func execute<T>(request: Request, decodingType: T.Type) async throws -> Response where T: Decodable {
        let urlRequest = try await prepareURLRequest(for: request)
        let (data, urlResponse) = try await URLSession.shared .data(from: urlRequest)
        let response = Response((urlResponse as? HTTPURLResponse, data: data, error: nil),
                                with: decodingType, for: request.dataType)
        
        if case .error = response {
            return try await execute(request: request, decodingType: decodingType)
        }
        print("Network Response - \(response)")
        return response
    }
    
    private func prepareURLRequest(for request: Request) async throws -> URLRequest {
        // Compose the url
        let basePath = Constants.Network.baseUrl
        let fullUrl = "\(basePath)\(request.path)"
        
        guard let url = URL(string: fullUrl) else {
            fatalError("URL preparation is failed!!!")
        }
        var urlRequest = URLRequest(url: url)

        switch request.parameters {
        case .url(let params):
            if let params = params as? [String: String] {
                let queryParams = params.map({ (element) -> URLQueryItem in
                    return URLQueryItem(name: element.key, value: element.value)
                })
                guard var components = URLComponents(string: fullUrl) else {
                    throw NetworkError.invalidData
                }
                components.queryItems = queryParams
                urlRequest.url = components.url
            } else {
                 throw NetworkError.invalidData
            }
        default:
            break
        }

        request.headers?.forEach { urlRequest.addValue($0.value as? String ?? "", forHTTPHeaderField: $0.key) }
        
        switch request.dataType {
        case .json:
            urlRequest.addValue("application/json", forHTTPHeaderField: HeaderKeys.contentType.rawValue)
        }
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
}

extension URLSession {
    func data(from urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
