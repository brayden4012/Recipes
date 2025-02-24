//
//  RecipeDomainModel.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation

struct RecipeDomainModel: Identifiable {
    var id: String
    var cuisine: String
    var name: String
    var photoUrlLarge: String?
    var photoUrlSmall: String?
    var sourceUrl: String?
    var youtubeUrl: String?
}

extension RecipeDomainModel {
    static var mockValue: RecipeDomainModel {
        RecipeDomainModel(
            id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            cuisine: "Malaysian",
            name: "Apam Balik",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        )
    }
}
