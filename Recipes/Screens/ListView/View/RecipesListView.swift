//
//  RecipesListView.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

struct RecipesListView: View {
    let recipesNetworkingService = DefaultRecipesNetworkingService()
    let imageDownloader = AsyncDownloader<Image?>()
    
    var body: some View {
        NavigationStack {
            BaseContentLoadingView(loadingTask: fetchRecipes) { recipes in
                if recipes.isEmpty {
                    ScrollView {
                        Text("No recipes 😢")
                            .font(.title)
                    }
                } else {
                    List(recipes) { recipe in
                        RecipeCardView(
                            recipe: recipe,
                            imageDownloader: imageDownloader
                        )
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Recipes")
        }
    }
    
    private func fetchRecipes() async throws -> [RecipeDomainModel] {
        await imageDownloader.clearCache()
        return try await recipesNetworkingService.getRecipes()
    }
}

#Preview {
    RecipesListView()
}
