//
//  Response.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import Foundation

public enum Response {
    public typealias Model = Decodable
    
    case json(_: Model)
    case error(_: Int?, _: Error?)
    
    init<Model: Decodable>(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?),
                           with decodingType: Model.Type, for dataType: DataType) {

        guard let res = response.r, 200 ... 299 ~= res.statusCode, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkError.invalidData)
            return
        }
        
        switch dataType {
        case .json:
            guard let decoded = data.parseJSON(with: decodingType) else {
                self = .error(response.r?.statusCode, NetworkError.parseError)
                return
            }
            self = .json(decoded)
        }
    }
}

extension Data {
    func parseJSON<Model>(with decodingType: Model.Type) -> Model? where Model: Decodable {
        let decoder = JSONDecoder()
        
        do {
            let jsonModel = try decoder.decode(Model.self, from: self)
            return jsonModel
        } catch let exception {
            print("JSON Exception \(exception)")
            return nil
        }
    }
}
