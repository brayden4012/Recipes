//
//  RecipesDataModel.swift
//  Recipes
//
//  Created by Brayden Harris on 2/23/25.
//

import Foundation

struct RecipesDataModel: Decodable {
    var recipes: [RecipeDataModel]
}
