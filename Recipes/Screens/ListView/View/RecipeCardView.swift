//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: RecipeDomainModel
    var imageDownloader: AsyncDownloader<Image?>
    
    var body: some View {
        HStack(alignment: .top) {
            RemoteImageView(
                url: recipe.photoUrlSmall,
                imageDownloader: imageDownloader
            ) {
                Image(systemName: "note.text").resizable()
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: .zero) {
                Text(recipe.name)
                    .font(.title2)
                    .foregroundStyle(Color.primary)
                Text(recipe.cuisine)
                    .foregroundStyle(Color.secondary)
                    .font(.title3)
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardBackground(
            insets: EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        )
    }
}

#Preview {
    RecipeCardView(
        recipe: RecipeDomainModel.mockValue,
        imageDownloader: .init()
    )
}
