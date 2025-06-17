//
//  MapperDTOProtocol.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation
import CoreData

protocol MapperDTOProtocol {
    associatedtype Entity: NSManagedObject
    associatedtype DTO: Decodable
    
    static func map(from dto: DTO, for context: NSManagedObjectContext) -> [Entity]
}
