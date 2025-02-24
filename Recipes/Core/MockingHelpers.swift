//
//  MockingHelpers.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

func getJSONData(fromFile name: String) throws -> Data {
    guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let data = try String(contentsOfFile: bundlePath).data(using: .utf8) else {
        throw NetworkingError.invalidURL
    }
    return data
}
