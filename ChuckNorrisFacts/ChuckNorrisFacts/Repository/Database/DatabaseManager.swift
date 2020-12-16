//
//  DatabaseManager.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 15/12/20.
//

import Foundation
import CoreData

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ChuckNorrisFacts")
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map { fatalError("Unresolved error \($0)") }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    private init() {}
    
    func saveCatories(categories: [String]) {
        let backgroundContext = persistentContainer.newBackgroundContext()
        
        backgroundContext.perform {
            categories.forEach { name in
                let entity = CategoryEntity.entity()
                let category = CategoryEntity(entity: entity, insertInto: backgroundContext)
                category.name = name
            }
            
            do {
                try backgroundContext.save()
            } catch {
                print("Fail to save data into database.")
            }
        }
    }
    
    func getCategories() -> [String] {
        do {
            let results: [CategoryEntity] = try context.fetch(CategoryEntity.fetchRequest())
            return results.map { $0.name ?? "undefined" }
        }
        catch {
            print("Fail to retrieve data from database.")
            return []
        }
    }
    
    func saveSearchTerm(term: String) {
        let backgroundContext = persistentContainer.newBackgroundContext()
        
        backgroundContext.perform {
            let entity = SearchTermEntity.entity()
            let searchTerm = SearchTermEntity(entity: entity, insertInto: backgroundContext)
            searchTerm.name = term
            searchTerm.createdAt = Date()
            
            do {
                try backgroundContext.save()
            } catch {
                print("Fail to save data into database.")
            }
        }
    }
    
    func getSearchTerms() -> [SearchTerm] {
        do {
            let results: [SearchTermEntity] = try context.fetch(SearchTermEntity.fetchRequest())
            return results.map { SearchTerm(term: $0.name ?? "undefined",
                                            createdAt: $0.createdAt ?? Date.init(timeIntervalSince1970: 0)) }
        }
        catch {
            print("Fail to retrieve data from database.")
            return []
        }
    }
}
