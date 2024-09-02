//
//  DaterService.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation

protocol DataServiceProtocol {
    func fetchDaters() async throws -> [DaterModel]
}

struct DaterService: DataServiceProtocol, HTTPDataDownloader {
    func fetchDaters() async throws -> [DaterModel] {
        guard let endpoint = datersURLString else {
            throw APIError.requestFailed(description: "Invalid endpoint")
        }
        
        guard let request = buildRequest(path: endpoint) else {
            throw APIError.requestFailed(description: "Unable to create URL")
        }
        
        let daters = try await fetchData(as: [Dater].self, endpointRequest: request)
        return daters.map({ DaterModel(dater: $0)})
    }
    
    /// DaterService Helpers
    private var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "raw.githubusercontent.com"
        components.path += "/downapp/sample/main/sample.json"
        return components
    }
    
    private var datersURLString: String? {
        let components = baseURLComponents
        return components.url?.absoluteString
    }
    
    private func buildRequest(path: String) -> URLRequest? {
        guard let url = URL(string: path) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
