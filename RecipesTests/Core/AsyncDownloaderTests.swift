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

    func test_intialValue_shouldNotBeCached() async throws {
        let value = try await getValue(1)
        XCTAssertEqual(value, 1)
    }
    
    func test_secondValue_shouldBeCached() async throws {
        try await getValue(1)
        let value = try await getValue(2)
        XCTAssertEqual(value, 1)
    }
    
    func test_secondValue_afterClearingCache_shouldNotBeCached() async throws {
        try await getValue(1)
        await asyncDownloader.clearCache()
        let value = try await getValue(2)
        XCTAssertEqual(value, 2)
    }

    @discardableResult
    private func getValue(_ asyncValue: Int) async throws -> Int {
        try await asyncDownloader.value(
            for: "1",
            asyncTask: Task.detached {
                return asyncValue
            }
        )
    }

}
