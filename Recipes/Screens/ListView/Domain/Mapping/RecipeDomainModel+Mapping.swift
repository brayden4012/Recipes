//
//  RecipeDomainModel+Mapping.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

extension RecipeDomainModel {
    init(dataModel: RecipeDataModel) {
        id = dataModel.uuid
        cuisine = dataModel.cuisine
        name = dataModel.name
        photoUrlLarge = dataModel.photoUrlLarge
        photoUrlSmall = dataModel.photoUrlSmall
        sourceUrl = dataModel.sourceUrl
        youtubeUrl = dataModel.youtubeUrl
    }
}
