//
//  TextWriteEntity+CoreDataProperties.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 12/08/2024.
//
//

import Foundation
import CoreData


extension TextWriteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextWriteEntity> {
        return NSFetchRequest<TextWriteEntity>(entityName: "TextWriteEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var book_id: String?
    @NSManaged public var color: NSObject?
    @NSManaged public var lastModificationDate: Date?

}

extension TextWriteEntity : Identifiable {

}
