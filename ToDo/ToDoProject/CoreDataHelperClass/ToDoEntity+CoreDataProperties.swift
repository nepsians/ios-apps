//
//  ToDoEntity+CoreDataProperties.swift
//  ToDoProject
//
//  Created by BentRay on 03/04/2021.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var status: Bool
    @NSManaged public var done: Int16

}

extension ToDoEntity : Identifiable {

}
