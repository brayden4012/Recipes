//
//  MockRecipesNetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

final class MockRecipesNetworkingService: RecipesNetworkingService {
    func getRecipes() async throws -> [RecipeDomainModel] {
        try await decodeResponse(from: "recipesResponse")
    }
    
    func getMalformedRecipes() async throws -> [RecipeDomainModel] {
        try await decodeResponse(from: "recipesResponseMalformed")
    }
    
    func getEmptyRecipes() async throws -> [RecipeDomainModel] {
        try await decodeResponse(from: "recipesResponseEmpty")
    }
    
    private func decodeResponse(from file: String) async throws -> [RecipeDomainModel] {
        let recipesDataModel: RecipesDataModel = try decodeResponse(data: getJSONData(fromFile: file), keyDecodingStrategy: .convertFromSnakeCase)
        return recipesDataModel.recipes.map { RecipeDomainModel(dataModel: $0) }
    }
}
