//
//  FactSearchResponse.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 14/12/20.
//

import Foundation

struct FactSearchResponse: Decodable {
    let total: Int
    let result: [Fact]
}
