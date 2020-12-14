//
//  FactsRepository.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 11/12/20.
//

import Foundation
import Alamofire
import RxSwift

class FactsRepository: RemoteRepository {
    
    func getRandomFact(category: String? = nil) -> Single<Fact> {
        return request(FactsAPI.getFacts(category: category))
    }
    
    func getCategories() -> Single<[String]> {
        return request(FactsAPI.getCategories)
    }
    
    func search(by query: String) -> Single<[Fact]> {
        return (request(FactsAPI.search(query: query)) as Single<FactSearchResponse>).map { $0.result }
    }
    
    
}
