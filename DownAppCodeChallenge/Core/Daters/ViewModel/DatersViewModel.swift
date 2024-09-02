//
//  DatersViewModel.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation

class DatersViewModel: ObservableObject {
    @Published var daterModels = [DaterModel]()
    @Published var errorMessage: String?
    @Published var xOffset: CGFloat = 0
    @Published var yOffset: CGFloat = 0
    @Published var showUserInfo: Bool = true
    @Published var choseToDate: Bool = false
    @Published var chosenToBeDown: Bool = false
    
    private let service: DataServiceProtocol

    init(service: DataServiceProtocol) {
        self.service = service
        Task { await fetchDaters() }
    }
    
    @MainActor
    func fetchDaters() async {
        do {
            self.daterModels = try await service.fetchDaters()
        } catch {
            if let error = error as? APIError {
                self.errorMessage = error.customDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func getDaterIndex(_ dater: DaterModel) -> Int {
        guard let index = daterModels.firstIndex(where: { $0.id == dater.id }) else { return -9 }
        return index
    }
    
    func removeDater(_ dater: DaterModel) {
        guard let index = daterModels.firstIndex(where: { $0.id == dater.id }) else { return }
        daterModels.remove(at: index)
    }
}

