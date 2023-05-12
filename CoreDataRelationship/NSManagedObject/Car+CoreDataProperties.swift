//
//  Car+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Esat Gözcü on 2023/05/12.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String{name ?? "Unknown Car"}
}

extension Car : Identifiable {

}
