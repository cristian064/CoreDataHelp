//
//  File.swift
//  
//
//  Created by cristian ayala on 11/01/22.
//

import CoreData

public protocol StorageProviderProtocol {
    var persistentContainer: NSPersistentContainer {get}
}

public extension StorageProviderProtocol {
    var viewContext: NSManagedObjectContext  {
        return persistentContainer.viewContext
    }
}
