//
//  DefaultRecipesNetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

final class DefaultRecipesNetworkingService: RecipesNetworkingService {
    func getRecipes() async throws -> [RecipeDomainModel] {
        let dataModel: RecipesDataModel = try await get(url: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json", keyDecodingStrategy: .convertFromSnakeCase)
        return dataModel.recipes.map { RecipeDomainModel(dataModel: $0) }
    }
}
