//
//  CoreTask+CoreDataProperties.swift
//  
//
//  Created by Ruslan Murin on 10.12.2020.
//
//

import Foundation
import CoreData


extension CoreTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreTask> {
        return NSFetchRequest<CoreTask>(entityName: "CoreTask")
    }

    @NSManaged public var text: String?
    @NSManaged public var key: String?
    

}
