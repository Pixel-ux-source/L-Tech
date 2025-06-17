//
//  NewsMapper.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation
import CoreData

struct NewsMapper: MapperDTOProtocol {
    static func map(from dto: NewsResponse, for context: NSManagedObjectContext) -> [News] {
        return dto.map { item in
            let news = News(context: context)
            news.id = item.id
            news.title = item.title
            news.text = item.text
            news.image = item.image
            news.date = item.date
            
            guard let sort = item.sort else { return news }
            news.sort = Int32(sort)
            return news
        }
    }
    
    typealias Entity = News
    
    typealias DTO = NewsResponse
}
