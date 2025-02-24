//
//  RecipeDataModel.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

struct RecipeDataModel: Decodable {
    var uuid: String
    var cuisine: String
    var name: String
    var photoUrlLarge: String?
    var photoUrlSmall: String?
    var sourceUrl: String?
    var youtubeUrl: String?
}
