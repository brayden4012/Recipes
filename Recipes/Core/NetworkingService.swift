//
//  NetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

protocol NetworkingService {
    func get<Response: Decodable>(url: String, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) async throws -> Response
    func retrieveData(for url: URL) async throws -> Data
    func decodeResponse<Response: Decodable>(data: Data, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) throws -> Response
}

extension NetworkingService {
    func get<Response: Decodable>(url: String, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> Response {
        let data = try await retrieveData(for: url)
        
        return try decodeResponse(data: data, keyDecodingStrategy: keyDecodingStrategy)
    }
    
    func retrieveData(for urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NetworkingError.invalidURL
        }
        
        return try await retrieveData(for: url)
    }
    
    func retrieveData(for url: URL) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw NetworkingError.invalidStatusCode(-1)
            }
            
            guard (200...299).contains(statusCode) else {
                throw NetworkingError.invalidStatusCode(statusCode)
            }
            return data
        } catch let error as URLError {
            throw NetworkingError.requestFailed(error)
        } catch {
            throw NetworkingError.otherError(error)
        }
    }
    
    func decodeResponse<Response: Decodable>(data: Data, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) throws -> Response {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = keyDecodingStrategy
            return try decoder.decode(Response.self, from: data)
        } catch let error as DecodingError {
            throw NetworkingError.decodingFailed(error)
        } catch {
            throw NetworkingError.otherError(error)
        }
    }
}
