//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import CoreData

public protocol StorageAPI: AnyObject {
    var persistentContainer: NSPersistentContainer {get set}
    func save()
}
