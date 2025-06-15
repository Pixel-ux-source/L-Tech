//
//  News+CoreDataProperties.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//
//

import Foundation
import CoreData

@objc(News)
public class News: NSManagedObject { }

extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var image: String?
    @NSManaged public var sort: Int32
    @NSManaged public var date: String?

}

extension News : Identifiable { }
