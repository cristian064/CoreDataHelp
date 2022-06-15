//
//  File.swift
//  
//
//  Created by Cristian Ayala on 15/06/22.
//

import Foundation

public enum ResponseDB<T> {
    case success(T)
    case failure(CoreDataError)
}
