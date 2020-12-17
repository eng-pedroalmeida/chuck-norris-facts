//
//  Fact.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation

struct Fact: Codable, Identifiable {
    let id: String
    let value: String
    let categories: [String]
}

extension Fact {
    enum CodingKeys: String, CodingKey {
        case id
        case value
        case categories
    }
}
