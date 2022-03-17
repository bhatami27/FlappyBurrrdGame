//
//  Score+CoreDataProperties.swift
//  FlabbyBurrd
//
//  Created by Zach Kilmer on 4/27/21.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: Int16
    @NSManaged public var player: Player_Information?

}

extension Score : Identifiable {

}
