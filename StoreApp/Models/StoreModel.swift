//
//  StoreModel.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/21/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let client = StoreHTTPClient()
    @Published var categories: [Category] = []
    
    func fetchCategories() async throws {
        categories = try await client.getCategories(url: URL.allCategories)
    }
    
}
