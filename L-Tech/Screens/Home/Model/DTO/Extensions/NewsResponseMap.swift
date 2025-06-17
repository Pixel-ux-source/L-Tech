//
//  NewsResponseMap.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation
import CoreData

extension NewsResponse: MappableProtocol {
    func map(in context: NSManagedObjectContext) throws -> [News] {
        NewsMapper.map(from: self, for: context)
    }
    
    typealias Entity = News
}
