//
//  APIParameters.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation

struct APIParameters {
    static let baseURL = "https://api.chucknorris.io"
    
    struct Keys {
        static let query = "query"
        static let category = "category"
    }
}

enum ContentType: String {
    case json = "application/json"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
