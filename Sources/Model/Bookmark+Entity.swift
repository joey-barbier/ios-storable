//
//  Bookmark+Entity.swift
//  OrkaPreviewData
//
//  Created by Joey BARBIER on 02/07/2022.
//

import Foundation
import CoreData
import OrkaCoreDataWrapper

final class Bookmark: NSManagedObject, EntityProtocol {
    static var entityName: String = "Bookmark"
    
    @NSManaged public var identifier: String
    @NSManaged public var data: String
    @NSManaged public var tag: String
    
    @discardableResult
    convenience init(id: String, data: String, tag: String) {
        guard let managedObjectContext = CoreDataHelper.context else {
            fatalError("Failed context")
        }
        self.init(context: managedObjectContext)
        
        self.identifier = id
        self.data = data
        self.tag = tag
        
        CoreDataHelper.save()
    }
}
