//
//  RemoteImageNetworkingService.swift
//  Recipes
//
//  Created by Brayden Harris on 2/22/25.
//

import Foundation
import SwiftUI

protocol RemoteImageNetworkingService: NetworkingService {
    func getImage(for url: String) async throws -> Image?
}
