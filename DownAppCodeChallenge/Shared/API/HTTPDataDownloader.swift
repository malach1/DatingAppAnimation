//
//  HTTPDataDownloader.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpointRequest: URLRequest) async throws -> T
}

extension HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpointRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: endpointRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed(description: "Request failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw error as? APIError ?? .unknownError(error: error)
        }
    }
}

extension HTTPDataDownloader {
    func mockFetchData<T: Decodable>(as type: T.Type, data: Data) async throws -> T?  {
        let jsonData = data
        return try JSONDecoder().decode(type, from: jsonData)
    }
}

