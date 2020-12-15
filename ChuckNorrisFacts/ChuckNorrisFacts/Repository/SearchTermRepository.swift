//
//  SearchTermRepository.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 15/12/20.
//

import Foundation

class SearchTermRepository {
    
    func getAll() -> [SearchTerm] {
        return DatabaseManager.shared.getSearchTerms()
    }
    
    func save(term: String) {
        DatabaseManager.shared.saveSearchTerm(term: term)
    }
}
