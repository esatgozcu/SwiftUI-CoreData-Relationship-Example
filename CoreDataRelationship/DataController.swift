//
//  DataController.swift
//  CoreDataRelationship
//
//  Created by Esat Gözcü on 2023/05/12.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Cars")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            //When you want a unique protoperty such as shortName. Add this policy.
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

