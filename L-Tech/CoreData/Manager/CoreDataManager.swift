//
//  HomeDataManager.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import UIKit
import CoreData

final class CoreDataManager: CoreDataManagerProtocol {
    // MARK: – Container
    private let container: NSPersistentContainer
    
    // MARK: – Initializate
    init(container: NSPersistentContainer) {
        self.container = container
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: – Create
    func create<T: MappableProtocol>(from dto: T, completion: @escaping (Result<[T.Entity], Error>) -> Void) {
        container.performBackgroundTask { context in
            do {
                let entities = try dto.map(in: context)
                try context.save()
                
                let objectIDs = entities.map { $0.objectID }

                DispatchQueue.main.async {
                    do {
                        let mainContextEntities = try objectIDs.map { objectID in
                            try self.container.viewContext.object(with: objectID) as! T.Entity
                        }
                        completion(.success(mainContextEntities))
                    } catch let error as NSError {
                        completion(.failure(error))
                    }
                }
            } catch let error as NSError {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: – Read
    func fetch<T: NSManagedObject>(of type: T.Type, limit: Int, sortDescriptors: [NSSortDescriptor]? = nil, completion: @escaping ([T]) -> Void) {
        let fetchRequest = News.fetchRequest()
        fetchRequest.fetchLimit = limit
        fetchRequest.sortDescriptors = sortDescriptors
        container.performBackgroundTask { context in
            do {
                let objects = try context.fetch(fetchRequest)
                let objectsID = objects.map { $0.objectID }
                DispatchQueue.main.async {
                    let mainContextObject: [T] = objectsID.compactMap {
                        self.container.viewContext.object(with: $0) as? T
                    }
                    completion(mainContextObject)
                }
            } catch let error as NSError {
                DispatchQueue.main.async {
                    completion([])
                }
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    // MARK: – Update
    func update<T: NSManagedObject>(of type: T.Type, with id: String, on changes: [HomeUpdate], completion: @escaping () -> Void) {
        container.performBackgroundTask { context in
            let fetchRequest = News.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %id", id)
            fetchRequest.fetchLimit = 1
            
            do {
                guard let todo = try context.fetch(fetchRequest).first else { return }
                changes.forEach { $0.apply(todo) }
                try context.save()
                DispatchQueue.main.async {
                    completion()
                }
            } catch let error as NSError {
                DispatchQueue.main.async {
                    completion()
                }
                print("Ошибка обновления записи: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: – Delete
    func delete(with id: Int64, completion: @escaping () -> ()) {
        container.performBackgroundTask { context in
            let fetchRequest = News.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %id", id)
            
            do {
                guard let model = try context.fetch(fetchRequest).first else { return }
                context.delete(model)
                completion()
                try context.save()
            } catch let error as NSError {
                print("Error delete data: \(error.localizedDescription)")
            }
        }
    }
}

enum HomeUpdate {
    case title(String)
    case text(String)
    case image(String)
    case date(String)
    
    var apply: (News) -> () {
        switch self {
        case .title(let value):
            return { $0.title = value }
        case .text(let value):
            return { $0.text = value }
        case .image(let value):
            return { $0.image = value }
        case .date(let value):
            return { $0.date = value }
        }
    }


}
