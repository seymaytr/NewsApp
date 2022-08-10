//
//  CoreDataManager.swift
//  NewsApp
//
//  Created by Seyma Yeter on 9.08.2022.
//

import Foundation

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllTasks() -> [ArticleDataModel] {
        let request: NSFetchRequest<ArticleDataModel> = ArticleDataModel.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
        }
        return[]
    }

    func save() {
         do {
             try viewContext.save()
         } catch {
             let error = error as NSError
             fatalError("An error occured: \(error)")
         }
     }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Articles")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack\(error)")
            }
        }
    }
}
