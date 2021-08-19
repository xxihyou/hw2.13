//
//  StorageManager.swift
//  CoreDataDemo
//
//  Created by Maria Berger on 18.08.2021.
//

import UIKit
import CoreData

class storageManager: UIResponder, UIApplicationDelegate {
    
    static var shared = storageManager()
    private override init() {}
    
    private var taskList: [Task] = []
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
 
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    

}
