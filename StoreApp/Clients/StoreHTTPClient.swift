//
//  StoreHTTPClient.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/21/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case decodingError
    case invalidServerResponse
    case invalidURL
}

class StoreHTTPClient {
    
    func getCategories(url: URL) async throws -> [Category] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return categories
        
    }
    
}
