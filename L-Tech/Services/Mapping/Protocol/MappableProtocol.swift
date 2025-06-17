//
//  AuthMappingProtocol.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation
import CoreData

protocol MappableProtocol {
    associatedtype Entity: NSManagedObject
    func map(in context: NSManagedObjectContext) throws -> [Entity]
}
