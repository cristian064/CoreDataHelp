//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import CoreData
import GenericUtilities

public extension StorageDB {

    func getDB<T:NSManagedObject>(fetchRequest: NSFetchRequest<T>,
                  completion: @escaping (ResponseDB<[T]>) -> Void) {
        do {
            let data = try storageProvider.viewContext.fetch(fetchRequest)
            completion(.success(data))
        }catch {
            completion(.failure(.cannotLoad))
        }
    }
    
    func saveDB(completion: @escaping (ResponseDB<Void>) -> Void) {
        
        if !storageProvider.viewContext.hasChanges {
            completion(.failure(.cannotSave))
            return
        }
        do {
            try storageProvider.viewContext.save()
            completion(.success(()))
        }catch {
            storageProvider.viewContext.rollback()
            completion(.failure(.cannotSave))
        }
    }
    
    func deleteRecordDB(deleteFetchRequest: NSFetchRequest<NSFetchRequestResult>,
                        completion: @escaping (ResponseDB<Void>) -> Void) {
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetchRequest)
        do {
            try storageProvider.viewContext.execute(batchDeleteRequest)
            try storageProvider.viewContext.save()
            completion(.success(()))
        }catch {
            storageProvider.viewContext.rollback()
            completion(.failure(.cannotDelete))
        }
    }
}
