//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 30/08/21.
//

import Foundation
import CoreData


public enum ResponseApi<T> {
    case success(T)
    case failure(Error)
}

public extension StorageAPI {
    func save() {
        do {
            try persistentContainer.viewContext.save()
        }catch {
            print(error)
        }
    }
    
    func getDB<T>(fetchRequest: NSFetchRequest<T>,
                  completion: @escaping (ResponseApi<[T]>) -> Void) {
        
        do {
            let data = try persistentContainer.viewContext.fetch(fetchRequest)
            completion(.success(data))
        }catch {
            completion(.failure(error))
        }
    }
}
