//
//  CoreDataManager.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 03/03/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager() //-> Singleton class
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data. \(error.localizedDescription)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved Successfully !!!")
        } catch let error {
            print("Error in saving Core Data: \(error.localizedDescription)")
        }
    }
}
