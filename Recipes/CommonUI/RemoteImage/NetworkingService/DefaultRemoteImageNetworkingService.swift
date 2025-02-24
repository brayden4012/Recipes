//
//  DefaultRemoteImageNetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import SwiftUI

final class DefaultRemoteImageNetworkingService: RemoteImageNetworkingService {
    func getImage(for url: String) async throws -> Image? {
        let data = try await retrieveData(for: url)
        
        guard let uiImage = UIImage(data: data) else { return nil }
        return Image(uiImage: uiImage)
    }
}
