//
//  TxEntity+CoreDataProperties.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 12/08/2024.
//
//

import Foundation
import CoreData


extension TxEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TxEntity> {
        return NSFetchRequest<TxEntity>(entityName: "TxEntity")
    }

    @NSManaged public var book_id: String?
    @NSManaged public var color: NSObject?
    @NSManaged public var id: UUID?
    @NSManaged public var lastModificationDate: Date?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension TxEntity : Identifiable {

}
