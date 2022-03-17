//
//  Player_Information+CoreDataProperties.swift
//  FlabbyBurrd
//
//  Created by Zach Kilmer on 4/27/21.
//
//

import Foundation
import CoreData


extension Player_Information {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player_Information> {
        return NSFetchRequest<Player_Information>(entityName: "Player_Information")
    }

    @NSManaged public var scores: NSSet?

}

// MARK: Generated accessors for scores
extension Player_Information {

    @objc(addScoresObject:)
    @NSManaged public func addToScores(_ value: Score)

    @objc(removeScoresObject:)
    @NSManaged public func removeFromScores(_ value: Score)

    @objc(addScores:)
    @NSManaged public func addToScores(_ values: NSSet)

    @objc(removeScores:)
    @NSManaged public func removeFromScores(_ values: NSSet)

}

extension Player_Information : Identifiable {

}
