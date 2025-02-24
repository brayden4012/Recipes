//
//  NetworkingError.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case requestFailed(URLError)
    case invalidStatusCode(Int)
    case decodingFailed(DecodingError)
    case otherError(Error)
}
