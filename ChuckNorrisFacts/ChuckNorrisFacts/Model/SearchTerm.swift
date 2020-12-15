//
//  SearchTerm.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 15/12/20.
//

import Foundation

class SearchTerm {
    let term: String
    let createdAt: Date
    
    init(term: String, createdAt: Date) {
        self.term = term
        self.createdAt = createdAt
    }
}
