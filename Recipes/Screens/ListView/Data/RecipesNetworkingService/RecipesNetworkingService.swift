//
//  RecipesNetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

protocol RecipesNetworkingService: NetworkingService {
    func getRecipes() async throws -> [RecipeDomainModel]
}
