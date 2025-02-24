//
//  RemoteImageViewModel.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

final class RemoteImageViewModel: ObservableObject {
    private let networkingService: RemoteImageNetworkingService
    let imageDownloader: AsyncDownloader<Image?>
    
    init(
        networkingService: RemoteImageNetworkingService = DefaultRemoteImageNetworkingService(),
        imageDownloader: AsyncDownloader<Image?>
    ) {
        self.networkingService = networkingService
        self.imageDownloader = imageDownloader
    }
    
    func getImage(for url: String?) async throws -> Image? {
        guard let url else { return nil }
        let downloadImageTask = Task {
            try await networkingService.getImage(for: url)
        }
        return try await imageDownloader.value(for: url, asyncTask: downloadImageTask)
    }
}
