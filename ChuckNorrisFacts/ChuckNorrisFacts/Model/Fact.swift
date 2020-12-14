//
//  Fact.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation

struct Fact: Codable {
    let id: String
    let value: String
    let categories: [String]
    let iconURL: String
}

extension Fact {
    enum CodingKeys: String, CodingKey {
        case id
        case value
        case categories
        case iconURL = "icon_url"
    }
}
