//
//  DatersViewModelTests.swift
//  DownAppCodeChallengeTests
//
//  Created by Malachi Hul on 2024/08/19.
//

import XCTest
@testable import DownAppCodeChallenge

final class DatersViewModelTests: XCTestCase {

    func testDependencyInjectionOfDaterService() {
        let service = MockDataService()
        let viewModel = DatersViewModel(service: service)
        
        XCTAssertNotNil(viewModel, "The view model should exists.")
    }
    
    func testSuccessfulDatersFetch() async {
        let service = MockDataService()
        let viewModel = DatersViewModel(service: service)
        
        await viewModel.fetchDaters()
        XCTAssertEqual(viewModel.daterModels.count, 6)
    }

    func testGetDaterIndex() async {
        let testDater = MockData.mockDater
        let testDaterModel = DaterModel(dater: testDater)
        
        let service = MockDataService()
        let viewModel = DatersViewModel(service: service)
        
        await viewModel.fetchDaters()
        let daterIndex = viewModel.getDaterIndex(testDaterModel)
        XCTAssertEqual(daterIndex, 0)
        
    }
    
    func testRemoveDaterFromModel() async {
        let testDater = MockData.mockDater
        let testDaterModel = DaterModel(dater: testDater)
        
        let service = MockDataService()
        let viewModel = DatersViewModel(service: service)
        
        await viewModel.fetchDaters()
        XCTAssertEqual(viewModel.daterModels.count, 6)
        
        let daterIndex = viewModel.getDaterIndex(testDaterModel)
        viewModel.removeDater(testDaterModel)
        XCTAssertEqual(viewModel.daterModels.count, 5)
        
    }
}
