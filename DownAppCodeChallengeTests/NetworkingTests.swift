//
//  NetworkingTests.swift
//  DownAppCodeChallengeTests
//
//  Created by Malachi Hul on 2024/08/19.
//

import XCTest
@testable import DownAppCodeChallenge

final class NetworkingTests: XCTestCase {
    func test_DecodeDatersIntoArray() throws {
        let daters = try JSONDecoder().decode([Dater].self, from: MockData.usersMockDaters)
        XCTAssertEqual(daters.count, 6)
    }
}
