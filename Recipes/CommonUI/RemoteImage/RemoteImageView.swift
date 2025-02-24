//
//  RemoteImageView.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

struct RemoteImageView<PlaceholderView: View>: View {
    @State private var image: Image?
    @StateObject private var viewModel: RemoteImageViewModel
    
    let url: String?
    let placeholder: PlaceholderView
    
    init(
        url: String?,
        imageDownloader: AsyncDownloader<Image?> = .init(),
        @ViewBuilder placeholder: () -> PlaceholderView
    ) {
        _viewModel = StateObject(wrappedValue: RemoteImageViewModel(imageDownloader: imageDownloader))
        self.url = url
        self.placeholder = placeholder()
    }
    
    var body: some View {
        if let image {
            image
                .resizable()
        } else {
            placeholder
                .task {
                    if let image = try? await viewModel.getImage(for: url) {
                        self.image = image
                    }
                }
        }
    }
}

#Preview {
    RemoteImageView(
        url: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
    ) {
        Image(systemName: "note.text").resizable()
    }
    .frame(width: 100, height: 100)
}
