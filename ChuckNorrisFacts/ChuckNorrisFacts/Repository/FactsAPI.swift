//
//  API.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation
import Alamofire

enum FactsAPI: APIConfiguration {
    
    case getFacts(category: String? = nil)
    case getCategories
    case search(query: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getFacts, .getCategories, .search:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getFacts:
            return "/jokes/random"
        case .getCategories:
            return "/jokes/categories"
        case .search:
            return "/jokes/search"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .search(let query):
            return [APIParameters.Keys.query: query]
        case .getFacts(let category):
            if let category = category {
                return [APIParameters.Keys.category: category]
            }
            
            return nil
        case .getCategories:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIParameters.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        switch self {
        case .search, .getFacts:
            if let parameters = parameters as? [String: String] {
                urlRequest = try URLEncodedFormParameterEncoder().encode(parameters, into: urlRequest)
            }
        default:
            break
        }
        
        return urlRequest
    }
}
