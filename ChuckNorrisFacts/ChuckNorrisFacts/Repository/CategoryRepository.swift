//
//  CategoryRepository.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 15/12/20.
//

import Alamofire
import RxSwift

class CategoryRepository: RemoteRepository {
    
    func getAll() -> [String] {
        return DatabaseManager.shared.getCategories()
    }
    
    func getAllRemote() -> Single<[String]> {
        return request(FactsAPI.getCategories)
    }
    
    func save(categories: [String]) {
        DatabaseManager.shared.saveCatories(categories: categories)
    }
}
