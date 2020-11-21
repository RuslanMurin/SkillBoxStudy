import Foundation
import CoreData


extension CoreTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreTask> {
        return NSFetchRequest<CoreTask>(entityName: "CoreTask")
    }

    @NSManaged public var text: String?

}
