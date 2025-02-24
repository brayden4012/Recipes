//
//  AsyncDownloader.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

actor AsyncDownloader<ValueType> {
    private enum CacheEntry {
        case inProgress(Task<ValueType, Error>)
        case ready(ValueType)
    }

    private var cache: [String: CacheEntry] = [:]

    func value(for key: String, asyncTask: Task<ValueType, Error>) async throws -> ValueType {
        if let cached = cache[key] {
            switch cached {
            case .ready(let value):
                print("Returning cached value for \(key)")
                return value
            case .inProgress(let task):
                return try await task.value
            }
        }

        print("Starting task to retrieve value for \(key)")
        cache[key] = .inProgress(asyncTask)

        do {
            let value = try await asyncTask.value
            cache[key] = .ready(value)
            return value
        } catch {
            cache[key] = nil
            throw error
        }
    }
    
    func clearCache() {
        cache.removeAll()
    }
}
