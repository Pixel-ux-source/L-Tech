//
//  CoreDataManagerProtocol.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func create<T: MappableProtocol>(from dto: T, completion: @escaping (Result<[T.Entity], Error>) -> Void)
    func fetch<T: NSManagedObject>(of type: T.Type, limit: Int, sortDescriptors: [NSSortDescriptor]?, completion: @escaping ([T]) -> Void)
}
