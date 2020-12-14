//
//  API.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
