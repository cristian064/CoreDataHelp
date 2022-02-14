//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import CoreData
import GenericUtilities

public protocol StorageAPI: AnyObject {
    var storageProvider: StorageProviderProtocol {get set}
    
    func getDB<T: NSManagedObject>(fetchRequest: NSFetchRequest<T>,
                  completion: @escaping (ResponseAPI<[T]>) -> Void)
    func saveDB(completion: @escaping (ResponseAPI<Void>) -> Void)
    func deleteRecordDB(deleteFetchRequest: NSFetchRequest<NSFetchRequestResult>,
                        completion: @escaping (ResponseAPI<Void>) -> Void)
}
