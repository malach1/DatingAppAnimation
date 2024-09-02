//
//  MockDaterService.swift
//  DownAppCodeChallengeTests
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation
@testable import DownAppCodeChallenge

class MockDataService: DataServiceProtocol {
    func fetchDaters() async throws -> [DaterModel] {
        let daters = try JSONDecoder().decode([Dater].self, from: MockData.usersMockDaters)
        return daters.map({ DaterModel(dater: $0)})
    }
}

