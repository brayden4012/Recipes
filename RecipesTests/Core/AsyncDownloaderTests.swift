//
//  AsyncDownloaderTests.swift
//  RecipesTests
//
//  Created by Brayden Harris on 2/23/25.
//

import Recipes
import XCTest

final class AsyncDownloaderTests: XCTestCase {
    var asyncDownloader: AsyncDownloader<Int>!

    override func setUpWithError() throws {
        asyncDownloader = .init()
    }

    func test_intialDownload_shouldNotBeCached() async throws {
        let value = try await asyncDownloader.value(for: "1", asyncTask: Task.detached(operation: {
            await self.fetchValue(1)
        }))
        XCTAssertEqual(value, 1)
    }
    
    func test_secondDownload_shouldBeCached() async throws {
        _ = try await asyncDownloader.value(for: "1", asyncTask: Task.detached(operation: {
            await self.fetchValue(1)
        }))
        let value2 = try await asyncDownloader.value(for: "1", asyncTask: Task.detached(operation: {
            await self.fetchValue(2)
        }))
        XCTAssertEqual(value2, 1)
    }

    private func fetchValue(_ returnValue: Int) async -> Int {
        return returnValue
    }

}
