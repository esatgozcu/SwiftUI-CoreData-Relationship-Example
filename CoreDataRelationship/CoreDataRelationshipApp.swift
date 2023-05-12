//
//  CoreDataRelationshipApp.swift
//  CoreDataRelationship
//
//  Created by Esat Gözcü on 2023/05/12.
//

import SwiftUI

@main
struct CoreDataRelationshipApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
