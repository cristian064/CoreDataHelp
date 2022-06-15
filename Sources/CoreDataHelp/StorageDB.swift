//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import CoreData
import GenericUtilities

public protocol StorageDB: AnyObject {
    var storageProvider: StorageProviderProtocol {get set}
    
    func getDB<T: NSManagedObject>(fetchRequest: NSFetchRequest<T>,
                  completion: @escaping (ResponseDB<[T]>) -> Void)
    func saveDB(completion: @escaping (ResponseDB<Void>) -> Void)
    func deleteRecordDB(deleteFetchRequest: NSFetchRequest<NSFetchRequestResult>,
                        completion: @escaping (ResponseDB<Void>) -> Void)
}
