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
            let data = try persistentContainer.viewContext.fetch(fetchRequest)
            completion(.success(data))
        }catch {
            completion(.failure(.init(error: error)))
        }
    }
    
    func saveDB(completion: @escaping (ResponseAPI<Void>) -> Void) {
        do {
            try persistentContainer.viewContext.save()
            completion(.success(()))
        }catch {
            completion(.failure(.init(error: error)))
        }
    }
    
    func deleteRecordDB(deleteFetchRequest: NSFetchRequest<NSFetchRequestResult>,
                        completion: @escaping (ResponseAPI<Void>) -> Void) {
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetchRequest)
        do {
            try persistentContainer.viewContext.execute(batchDeleteRequest)
            try persistentContainer.viewContext.save()
            completion(.success(()))
        }catch {
            completion(.failure(.init(error: error)))
        }
    }
}
