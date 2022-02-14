//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import CoreData
import GenericUtilities

public extension StorageAPI {

    func getDB<T:NSManagedObject>(fetchRequest: NSFetchRequest<T>,
                  completion: @escaping (ResponseAPI<[T]>) -> Void) {
        do {
            let data = try storageProvider.viewContext.fetch(fetchRequest)
            completion(.success(data))
        }catch {
            completion(.failure(.init(error: error)))
        }
    }
    
    func saveDB(completion: @escaping (ResponseAPI<Void>) -> Void) {
        
        if !storageProvider.viewContext.hasChanges {
            completion(.failure(.init(code: 7000)))
            return
        }
        do {
            try storageProvider.viewContext.save()
            completion(.success(()))
        }catch {
            storageProvider.viewContext.rollback()
            completion(.failure(.init(error: error)))
        }
    }
    
    func deleteRecordDB(deleteFetchRequest: NSFetchRequest<NSFetchRequestResult>,
                        completion: @escaping (ResponseAPI<Void>) -> Void) {
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetchRequest)
        do {
            try storageProvider.viewContext.execute(batchDeleteRequest)
            try storageProvider.viewContext.save()
            completion(.success(()))
        }catch {
            storageProvider.viewContext.rollback()
            completion(.failure(.init(error: error)))
        }
    }
}
