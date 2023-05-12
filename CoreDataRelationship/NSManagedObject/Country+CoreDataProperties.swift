//
//  Country+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Esat Gözcü on 2023/05/12.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var brand: NSSet?

    public var wrappedShortName: String{shortName ?? "Unknown Country"}
    public var wrappedFullName: String{fullName ?? "Unknown Country"}

    public var carArray: [Car]{
        let set = brand as? Set<Car> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for brand
extension Country {

    @objc(addBrandObject:)
    @NSManaged public func addToBrand(_ value: Car)

    @objc(removeBrandObject:)
    @NSManaged public func removeFromBrand(_ value: Car)

    @objc(addBrand:)
    @NSManaged public func addToBrand(_ values: NSSet)

    @objc(removeBrand:)
    @NSManaged public func removeFromBrand(_ values: NSSet)

}

extension Country : Identifiable {

}
